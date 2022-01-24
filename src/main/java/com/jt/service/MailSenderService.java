package com.jt.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.jt.domain.MailUploadDTO;

public interface MailSenderService {

	public boolean SendMail(MailUploadDTO mailUpload) throws UnsupportedEncodingException;
	
	//메일전송
	public boolean MailProc(String sender, String recipient, String title, String contents, List<String> al_attach) throws UnsupportedEncodingException;

}





