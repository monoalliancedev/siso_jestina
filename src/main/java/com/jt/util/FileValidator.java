package com.jt.util;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
  
@Component
public class FileValidator implements Validator {   
  
	@Override  
	public boolean supports(Class<?> arg0) {   
		return false;   
	}   
  
	@Override  
	public void validate(Object uploadedFile, Errors errors) {
		UploadedFile file = (UploadedFile) uploadedFile;   
		if (file.getFile().getSize() == 0) {   
			errors.rejectValue("file", "001","Please select a file!");   
		}
	}   
}  
