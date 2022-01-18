package com.jt.controller;


import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CommonController {
	@Value("${attach_upload_path}")
	private String uploadRoot;

	@Value("${attach_upload_url}")
	private String uploadUrl;

	Logger log = LoggerFactory.getLogger(this.getClass());	
	
	
	@GetMapping(value="/error.do")
	public String error() {
		return "error";
	}
	
	
	@GetMapping("/common/fildDownload")	
	public ResponseEntity<Resource> fildDownload(HttpServletRequest request, @RequestParam String filename, @RequestParam String real_filename){
		
		String browser = request.getHeader("User-Agent");
        boolean isMs = browser.contains("MSIE") || browser.contains("Trident");
		
		try {			
			
		    //request.setCharacterEncoding("UTF-8");
			File file = new File(uploadRoot+real_filename);
			if (!file.exists()) {
				
				
				String a[] = real_filename.split("\\/");
				String tmp = "/"+a[1]+"/"+a[2]+"/"+a[3]+"/"+a[4]+"/"+filename;
				log.debug("==============================================");
				log.debug(tmp);
				if (isMs) {
					//tmp = java.net.URLEncoder.encode(tmp, "utf-8").replaceAll("\\+", "%20");
				}else {
					//tmp = java.net.URLEncoder.encode(tmp, "utf-8");					
				}
				file = new File(uploadRoot+tmp);
				
			}
			if (file.exists()) {
				Resource rs = null;
				rs = new UrlResource(file.toURI());
				if (isMs) {
					return ResponseEntity.ok()
						.header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\""+java.net.URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20") +"\";")	//다운 받아지는 파일 명 설정
						.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(file.length()))	//파일 사이즈 설정
						.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())	//바이너리 데이터로 받아오기 설정
						.body(rs);	//파일 넘기기
				}else {
					return ResponseEntity.ok()
						.header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\""+java.net.URLEncoder.encode(filename, "utf-8") +"\";")	//다운 받아지는 파일 명 설정
						.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(file.length()))	//파일 사이즈 설정
						.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())	//바이너리 데이터로 받아오기 설정
						.body(rs);	//파일 넘기기
				}
			}else {
				log.debug("==============================================");
				log.debug(real_filename);
				return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
			}
			
		} catch (Exception e ) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		} 		
	}
	
	
	
}
