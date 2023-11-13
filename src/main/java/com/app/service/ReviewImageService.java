package com.app.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ListObjectsV2Request;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3ObjectSummary;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ReviewImageService {

	final String endPoint = "https://kr.object.ncloudstorage.com";
	final String regionName = "kr-standard";
	final String accessKey = "4709021E30889EA71430";
	final String secretKey = "502BB99B1FF4B5B0385E8214586B9BDF25FBB23C";
	String bucketName = "team2-bucket";
	
	////////accessKey, secretKey 테스트 중/////////
//	final String endPoint = "https://kr.object.ncloudstorage.com";
//	final String regionName = "kr-standard";
//	
//	@Value("${cloud.aws.credentials.accessKey}")
//	private String accessKey;
//	
//	@Value("${cloud.aws.credentials.secretKey}")
//	private String secretKey;
//
//    @Value("${cloud.aws.s3.bucket}")
//    private String bucketName;

	// S3 client
	final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
	    .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
	    .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
	    .build();
	
	//음식점 리뷰 이미지 업로드
    public String upload(MultipartFile multipartFile, String dirName, int review_id, int index) throws IOException {
        String fileName = multipartFile.getOriginalFilename();
        String newDirName = "res_review/" + "res_" + review_id;
        String newFileName = "image_" + index;
        String fileKey = "res_review/res_" + review_id + "/image_" + index;
        	//https://kr.object.ncloudstorage.com/team2-bucket/res_review/res_1/image_1
        String fileUrl = getBucketFileUrl(fileKey);
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(multipartFile.getSize());
        metadata.setContentType(multipartFile.getContentType());
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, newDirName + "/" + newFileName, multipartFile.getInputStream(), metadata)
        		.withCannedAcl(CannedAccessControlList.PublicRead);

    	try {
    	    s3.putObject(putObjectRequest);
    	    System.out.format("Folder %s has been created.\n", dirName);
    	} catch (AmazonS3Exception e) {
    	    e.printStackTrace();
    	} catch(SdkClientException e) {
    	    e.printStackTrace();
    	}
    	return fileUrl;
    }

    //숙소 리뷰 이미지 업로드
    public String lodUpload(MultipartFile multipartFile, String dirName, int review_id, int index) throws IOException {
    	String fileName = multipartFile.getOriginalFilename();
    	String newDirName = "lod_review/" + "lod_" + review_id;
    	String newFileName = "image_" + index;
    	String fileKey = "lod_review/lod_" + review_id + "/image_" + index;
    	//https://kr.object.ncloudstorage.com/team2-bucket/lod_review/lod_1/image_1
    	String fileUrl = getBucketFileUrl(fileKey);
    	ObjectMetadata metadata = new ObjectMetadata();
    	metadata.setContentLength(multipartFile.getSize());
    	metadata.setContentType(multipartFile.getContentType());
    	PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, newDirName + "/" + newFileName, multipartFile.getInputStream(), metadata)
    			.withCannedAcl(CannedAccessControlList.PublicRead);
    	
    	try {
    		s3.putObject(putObjectRequest);
    		System.out.format("Folder %s has been created.\n", dirName);
    	} catch (AmazonS3Exception e) {
    		e.printStackTrace();
    	} catch(SdkClientException e) {
    		e.printStackTrace();
    	}
    	return fileUrl;
    }
    
    
    public String getBucketFileUrl(String key) {
        // 버킷 파일의 URL을 생성
        String fileUrl = s3.getUrl(bucketName, key).toString();
        return fileUrl;
    }

    
    //음식점 리뷰 삭제 시 스토리지의 객체 삭제
    public void res_del_img(int review_id) {
        String folderKey = "res_review/res_" + review_id + "/";

        // 폴더 내의 객체 목록 가져오기
        ListObjectsV2Request listObjectsRequest = new ListObjectsV2Request().withBucketName(bucketName).withPrefix(folderKey);
        ListObjectsV2Result objectListing = s3.listObjectsV2(listObjectsRequest);

        // 폴더 내의 각 객체를 삭제
        for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
            String objectKey = objectSummary.getKey();
            try {
                s3.deleteObject(bucketName, objectKey);
                System.out.format("객체 %s가 삭제되었습니다.\n", objectKey);
            } catch (AmazonS3Exception e) {
                e.printStackTrace();
            } catch (SdkClientException e) {
                e.printStackTrace();
            }
        }
    }

    //숙소 리뷰 삭제 시 스토리지의 객체 삭제
    public void lod_del_img(int review_id) {
    	String folderKey = "lod_review/lod_" + review_id + "/";
    	
    	// 폴더 내의 객체 목록 가져오기
    	ListObjectsV2Request listObjectsRequest = new ListObjectsV2Request().withBucketName(bucketName).withPrefix(folderKey);
    	ListObjectsV2Result objectListing = s3.listObjectsV2(listObjectsRequest);
    	
    	// 폴더 내의 각 객체를 삭제
    	for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
    		String objectKey = objectSummary.getKey();
    		try {
    			s3.deleteObject(bucketName, objectKey);
    			System.out.format("객체 %s가 삭제되었습니다.\n", objectKey);
    		} catch (AmazonS3Exception e) {
    			e.printStackTrace();
    		} catch (SdkClientException e) {
    			e.printStackTrace();
    		}
    	}
    }
}
