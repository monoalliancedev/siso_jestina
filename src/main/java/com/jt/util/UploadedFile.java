package com.jt.util;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadedFile {   
  
	private MultipartFile file;   
	private List<MultipartFile> files;
  
	public MultipartFile getFile() {   
		return file;   
	}   
  
	public void setFile(MultipartFile file) {   
		this.file = file;   
	}
	
	public List<MultipartFile> getFiles() {   
		return files;   
	}   
  
	public void setFiles(List<MultipartFile> files) {   
		this.files = files;   
	}   
	
}  
