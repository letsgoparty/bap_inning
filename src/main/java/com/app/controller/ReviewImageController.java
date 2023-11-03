package com.app.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.services.s3.model.S3ObjectSummary;

@Controller
public class ReviewImageController {

	/////////////NCP Object Storage////////////
	
	final String endPoint = "https://kr.object.ncloudstorage.com";
	final String regionName = "kr-standard";
	
	@Value("${cloud.aws.credentials.accessKey}")
	private String accessKey;
	
	@Value("${cloud.aws.credentials.secretKey}")
	private String secretKey;

	
	@GetMapping("/uploadTest")
    public void uploadTest() {
		
		// S3 client
		final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
				.build();
		
		String bucketName = "team2-bucket";
		
		// create folder
//		String folderName = "review_img/restaurant/";
//	
//		ObjectMetadata objectMetadata = new ObjectMetadata();
//		objectMetadata.setContentLength(0L);
//		objectMetadata.setContentType("application/x-directory");
//		PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, folderName, new ByteArrayInputStream(new byte[0]), objectMetadata);
//	
//		try {
//		    s3.putObject(putObjectRequest);
//		    System.out.format("Folder %s has been created.\n", folderName);
//		} catch (AmazonS3Exception e) {
//		    e.printStackTrace();
//		} catch(SdkClientException e) {
//		    e.printStackTrace();
//		}
	
		// upload local file
		String objectName = "review_img/restaurant/test-image";
		String filePath = "/upload/test-image.jpg";
	
		try {
		    //s3.putObject(bucketName, objectName, new File(filePath));
		    // 변경될 코드 => ★★ ACL 공개 권한 부여하는 코드 ★★
		    // PutObjectRequest 객체 생성하면서 메서드를 이용한 PublicRead 권한 부여
		    s3.putObject(new PutObjectRequest(bucketName, objectName, new File(filePath))
		            .withCannedAcl(CannedAccessControlList.PublicRead));
		    
		    System.out.format("Object %s has been created.\n", objectName);
		} catch (AmazonS3Exception e) {
		    e.printStackTrace();
		} catch(SdkClientException e) {
		    e.printStackTrace();
		}
		
	}
	
	@GetMapping("/uploadList")
	public void uploadList() {

		// S3 client
		final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
				.build();
		
		String bucketName = "team2-bucket";
		
		// list all in the bucket
		try {
		    ListObjectsRequest listObjectsRequest = new ListObjectsRequest()
		        .withBucketName(bucketName)
		        .withMaxKeys(300);

		    ObjectListing objectListing = s3.listObjects(listObjectsRequest);

		    System.out.println("Object List:");
		    while (true) {
		        for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
		            System.out.println("    name=" + objectSummary.getKey() + ", size=" + objectSummary.getSize() + ", owner=" + objectSummary.getOwner().getId());
		        }

		        if (objectListing.isTruncated()) {
		            objectListing = s3.listNextBatchOfObjects(objectListing);
		        } else {
		            break;
		        }
		    }
		} catch (AmazonS3Exception e) {
		    System.err.println(e.getErrorMessage());
		    System.exit(1);
		}

		// top level folders and files in the bucket
		try {
		    ListObjectsRequest listObjectsRequest = new ListObjectsRequest()
		        .withBucketName(bucketName)
		        .withDelimiter("/")
		        .withMaxKeys(300);

		    ObjectListing objectListing = s3.listObjects(listObjectsRequest);

		    System.out.println("Folder List:");
		    for (String commonPrefixes : objectListing.getCommonPrefixes()) {
		        System.out.println("    name=" + commonPrefixes);
		    }

		    System.out.println("File List:");
		    for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
		        System.out.println("    name=" + objectSummary.getKey() + ", size=" + objectSummary.getSize() + ", owner=" + objectSummary.getOwner().getId());
		    }
		} catch (AmazonS3Exception e) {
		    e.printStackTrace();
		} catch(SdkClientException e) {
		    e.printStackTrace();
		}
	}

	@GetMapping("/download")
	public void download() throws FileNotFoundException {

		// S3 client
		final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
		    .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
		    .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
		    .build();

		String bucketName = "team2-bucket";
		String objectName = "review_img/kt-logo.png";
		String downloadFilePath = "/upload/kt-logo.png";

		// download object
		try {
		    S3Object s3Object = s3.getObject(bucketName, objectName);
		    S3ObjectInputStream s3ObjectInputStream = s3Object.getObjectContent();

		    OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(downloadFilePath));
		    byte[] bytesArray = new byte[4096];
		    int bytesRead = -1;
		    while ((bytesRead = s3ObjectInputStream.read(bytesArray)) != -1) {
		        outputStream.write(bytesArray, 0, bytesRead);
		    }

		    outputStream.close();
		    s3ObjectInputStream.close();
		    System.out.format("Object %s has been downloaded.\n", objectName);
		} catch (AmazonS3Exception e) {
		    e.printStackTrace();
		} catch(SdkClientException e) {
		    e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/uploadDelete")
	public void delete() {
		// S3 client
		final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
		    .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
		    .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
		    .build();

		String bucketName = "team2-bucket";
		String objectName = "res-review-image-test2";

		// delete object
		try {
		    s3.deleteObject(bucketName, objectName);
		    System.out.format("Object %s has been deleted.\n", objectName);
		} catch (AmazonS3Exception e) {
		    e.printStackTrace();
		} catch(SdkClientException e) {
		    e.printStackTrace();
		}
	}
}
