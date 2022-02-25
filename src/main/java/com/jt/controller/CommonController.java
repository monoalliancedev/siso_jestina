package com.jt.controller;


import java.io.File;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jt.domain.UploadFileDTO;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;

@Controller
public class CommonController {
	@Value("${attach_upload_path}")
	private String uploadRoot;

	@Value("${attach_upload_url}")
	private String uploadUrl;

	@Value("${attach_download_path}")
	private String downloadRoot;
	
	Logger log = LoggerFactory.getLogger(this.getClass());	
	
	@Autowired
	UploadFileService fileService;
	
	
	@GetMapping(value="/error.do")
	public String error() {
		return "error";
	}
	
	//오픈 준비중 페이지 
	@GetMapping(value="/openning")
	public String openning() {
		return "openning";
	}
	
	
	//입사지원서 파일 경로설정후 downloadFile() 호출
	@GetMapping("/common/applicationDownload")	
	public ResponseEntity<Object> applicationDownload () throws Exception{

		String fileRootPath = downloadRoot + "/recruit/Jestina_application_form.docx";
		return  downloadFile(fileRootPath,"file");
	}
	
	//이미지 파일 경로 설정후 downloadFile() 호출
	@GetMapping(value = "/UploadFiles/{folder}/{year}/{month}/{day}/{fileName}")
	public ResponseEntity<Object> download2Proc (@PathVariable(value = "folder") String folder, @PathVariable(value = "year") String year
												, @PathVariable(value = "month") String month, @PathVariable(value = "day") String day
												, @PathVariable(value = "fileName") String fileName
											)throws Exception {
		
		String fileRootPath = downloadRoot + "/"+folder+"/"+year+"/"+month+"/"+day+"/"+fileName;
		return  downloadFile(fileRootPath,"uploadfile");
	}
	
	
	//파일 다운로드(이미지,입사지원서)
	public ResponseEntity<Object> downloadFile(String fileRootPath, String gubun) throws Exception {
		ResponseEntity<Object> retVal = null;
		
		Path filePath = Paths.get(fileRootPath);
		System.out.println("#################### filePath : "+filePath); //=>  D:\works\jestina\UploadFile\Jewelry\2022\02\21\Up_jestina_1_20220221140351.jpg
		
		Resource resource = new InputStreamResource(Files.newInputStream(filePath)); // 파일 resource 얻기
		
		File file = new File(fileRootPath);
				
		byte[] bytes = file.getName().getBytes(StandardCharsets.UTF_8);
		String downloadFileName = new String(bytes, StandardCharsets.UTF_8);
		
		if(gubun.equals("file")) {
			downloadFileName = "입사지원서.docx";
		}
		
		retVal = ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\""+java.net.URLEncoder.encode(downloadFileName, "utf-8") +"\";")	//다운 받아지는 파일 명 설정
				.header(HttpHeaders.CONTENT_LENGTH, String.valueOf(file.length()))	//파일 사이즈 설정
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM.toString())	//바이너리 데이터로 받아오기 설정
				.body(resource);	//파일 넘기기		

				
		return retVal;
	}	
	
	
	//게시판 첨부파일호출
	@GetMapping("/common/fildDownload")	
	public ResponseEntity<Resource> fildDownload(HttpServletRequest request, int seq, String Folder){
		
		String filename;
		String real_filename;
		
		UploadFileDTO fileDTO = fileService.select(seq);
		if(!ComUtils.isEmpty(fileDTO)) {
			
			filename = fileDTO.getFilename();
			real_filename = "/" + Folder + "/" + fileDTO.getSave_filename();
			
			String browser = request.getHeader("User-Agent");
	        boolean isMs = browser.contains("MSIE") || browser.contains("Trident");
			
			try {			
				
			    //request.setCharacterEncoding("UTF-8");
				File file = new File(uploadRoot+real_filename);
				
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
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	
}
