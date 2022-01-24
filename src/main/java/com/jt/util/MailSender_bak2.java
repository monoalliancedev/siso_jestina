package com.jt.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailSender_bak2 {
	
	public boolean sendMail(String sender, String recipient, String contents, ArrayList<String> al_attach) throws UnsupportedEncodingException {
        //프로퍼티를 생성한다.
        Properties prop = new Properties();
        
        prop.put("mail.smtp.host", "smtp.naver.com");
        prop.put("mail.smtp.port", 587);
        prop.put("mail.smtp.auth", "true");
       
        
        //세션 인스턴스를 생성한다.
        Session session = Session.getInstance(prop,  new Authenticator()
    	{
    		public PasswordAuthentication getPasswordAuthentication()
    		{
    			return new PasswordAuthentication("kejgogogo", "ab381016@#");
    		}
    	});
                
        //Message 객체를 준비한다.
        MimeMessage msg = new MimeMessage(session);
        
        try{            
            
        	// 내용(Text/Html) + 파일 Multipart 전송
            Multipart multipart = new MimeMultipart();

            // 내용(Text/Html) 첨부하기
            MimeBodyPart attachPart = new MimeBodyPart();
            attachPart.setContent(contents, "text/html; charset=EUC-KR");
            multipart.addBodyPart(attachPart);
            Transport.send(msg);
            
            /*/ 파일 첨부하기
            attachPart = new MimeBodyPart();
            attachPart.setDataHandler(new DataHandler(new FileDataSource(new File("/storage/emulated/0/Pictures/KakaoTalk/1463012583477.jpeg"))));
            multipart.addBodyPart(attachPart);
            msg.setContent(multipart);
            Transport.send(msg);
            */
            
            
            /*
        	// 내용(Text/Html) + 파일 Multipart 전송
            Multipart multipart = new MimeMultipart();
            MimeBodyPart attachPart = null;


            // 내용(Text/Html) 첨부하기
            if (!contents.isEmpty()) {
                attachPart = new MimeBodyPart();
                attachPart.setContent(contents, "text/html; charset=EUC-KR");
                multipart.addBodyPart(attachPart);
            }

            // 파일 첨부하기
            if (! al_attach.isEmpty()) {
                for (String path : al_attach) {
                    attachPart = new MimeBodyPart();
                    attachPart.setDataHandler(new DataHandler(new FileDataSource(new File(path))));
                    multipart.addBodyPart(attachPart);
                }
            }
            if (multipart.getCount() > 0) msg.setContent(multipart);
            
            Transport.send(msg);
            */
            
            return true;

        } catch(MessagingException mex) {
            return false;
        }
    }
}





