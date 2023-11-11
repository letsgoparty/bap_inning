package com.app.service;

import java.io.File;
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
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/*
 * 관리자 페이지 - 음식점 이미지 등록
 */

@Service
@RequiredArgsConstructor
@Slf4j
public class LodUploadService {
	
	
	final String endPoint = "https://kr.object.ncloudstorage.com";
	final String regionName = "kr-standard";
	final String accessKey = "4709021E30889EA71430";
	final String secretKey = "502BB99B1FF4B5B0385E8214586B9BDF25FBB23C";
	String bucketName = "team2-bucket";

	// S3 client
	final AmazonS3 s3 = AmazonS3ClientBuilder.standard()
	    .withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(endPoint, regionName))
	    .withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(accessKey, secretKey)))
	    .build();
	
    public String upload(MultipartFile multipartFile, String dirName, int lodging_id) throws IOException {
        String fileName = multipartFile.getOriginalFilename();
        String newDirName = "lodging_images";
        String newFileName = "lod" + lodging_id + ".png";
        String fileKey = "lodging_images/lod" + lodging_id+ ".png";
        String fileUrl = getBucketFileUrl(fileKey);
        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(multipartFile.getSize());
        metadata.setContentType(multipartFile.getContentType());
        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, newDirName + "/" + newFileName, multipartFile.getInputStream(), metadata).withCannedAcl(CannedAccessControlList.PublicRead);

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

}