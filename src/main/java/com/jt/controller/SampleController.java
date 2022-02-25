package com.jt.controller;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.jt.service.UploadFileService;
import com.jt.util.FileValidator;


@Controller  
public class SampleController {   
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Value("${attach_download_path}") 
	private String downloadRoot;
	@Value("${attach_download_url}")
	private String downloadUrl;
	
	
	@Value("${attach_upload_path}") 
	private String uploadRoot;
	@Value("${attach_upload_url}") 
	private String uploadUrl;
	
	
	
	@Autowired  
	FileValidator fileValidator;   

	@Autowired
	UploadFileService ufService;

	
	@GetMapping(value="/sample")
	public ModelAndView sample() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/sample");
		mv.addObject("DownloadUrl", downloadUrl);
		
		return mv;
	}

}
	