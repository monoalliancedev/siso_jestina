package com.jt.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.jt.domain.MailUploadDTO;
import com.jt.domain.RecruitmentDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.service.MailSenderService;
import com.jt.service.RecruitmentService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;


@Service
public class MailSenderServiceImpl implements MailSenderService {

	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Value("${send_mail_smtp_host}")
	private String MailSmtpHost;
	@Value("${send_mail_port}")
	private String MailPort;
	@Value("${send_mail_id}")
	private String MailID;
	@Value("${send_mail_pw}")
	private String MailPW;
	@Value("${send_mail_sender}")
	private String MailSender;
	@Value("${send_mail_recipients}")
	private String MailRecipients;

	@Autowired
	UploadFileService fileService;
	@Autowired
	RecruitmentService recruitService;
	
	//메일셋팅후 메일 전송
	@Override
	public boolean SendMail(MailUploadDTO mailUpload) {
		
		String sender = MailSender; //보내는 메일(네이비 메일계정을 쓸때는 네이버 메일을 입력해야한다.) 
		String recipient = ""; //받는 메일
		String recipientCC = ""; //받는 참조 메일
		String title = "입사지원"; //메일제목
		String mailText = ""; //메일내용(html)
		
		if(mailUpload.getRecruit()!=null && mailUpload.getRecruit()!="") {
			RecruitmentDTO recruit = recruitService.select(Integer.parseInt(mailUpload.getRecruit()));
			title += " ("  + recruit.getJobField() +")" ;
			mailText += " 모집부분 : "  + recruit.getJobField() +"<br>";
			recipient = recruit.getManagerEmail1(); //받는메일
			recipientCC = recruit.getManagerEmail2(); //받는참조메일
		}
		
		mailText += " 이 름 : " + mailUpload.getName() +"<br>";
		mailText += " 핸드폰 : "+ mailUpload.getHp() +"<br>";
		mailText += " 이메일 : " + mailUpload.getEmail() +"<br>";
		mailText += " --------------------------------------------------<br>";	
		mailText += "" + mailUpload.getContents().replace("\r\n","<br>") +"<br>";	
		
		//System.out.println("#### " + mailUpload.getUploadFile().get(0).getOriginalFilename());
		//System.out.println("#### " + mailUpload.getUploadFile().get(0).getOriginalFilename());
		
		//파일을 업로드하고 fileDB에 넣어준다 : return = seq배열.
		int[] arrFileSeq = fileService.fileUploadMultiInsert("Email", mailUpload.getUploadFile(), mailUpload.getEmail()); //폴더명,List<MultipartFile>파일
		
		//DB에서 파일정보 가져와서 메일에 경로값을 셋팅해준다.
		List<String> al_attach = new ArrayList<>();
		List<String> al_attach_name = new ArrayList<>();
		for(int fileSeq : arrFileSeq) {
			UploadFileDTO fileDTO = fileService.select(fileSeq);
			if(!ComUtils.isEmpty(fileDTO)) {
				al_attach.add(uploadRoot+"/Email/"+ fileDTO.getSave_filename()); //업로드된 파일경로를 al_attach에 넣어준다.
				al_attach_name.add(fileDTO.getFilename()); //파일명
				//fileDTO.getFile_size()	
				continue;
			}
		}
		
		System.out.println("########### 메일 보내기");
		
		if (MailProc(sender, recipient, recipientCC, title, mailText, al_attach, al_attach_name)) {
			System.out.println("FAT = "+sender+" = message sent successfully...");

			//첨부파일 삭제
			for(int fileSeq : arrFileSeq) {
				fileService.selectAndDelete(fileSeq);
            }
	        return true;
        }else {
        	System.out.println("########### 메일 보내기 실패");
        	return false;
        }
	}
	
	
	//메일전송
	@Override
	public boolean MailProc(String sender, String recipient, String recipientCC, String title, String contents
							, List<String> al_attach, List<String> al_attach_name){
        
		//프로퍼티를 생성한다.
        Properties prop = new Properties();
        
        prop.put("mail.smtp.host", MailSmtpHost);
        prop.put("mail.smtp.port", MailPort);
        prop.put("mail.smtp.auth","true");
        prop.put("mail.mime.charset","utf-8");
        prop.put("mail.mime.encodefilname","true");
        //-- 구글 추가
        prop.put("mail.smtp.ssl.enable", "true"); 
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        
        
        
        //세션 인스턴스를 생성한다.
        Session session = Session.getInstance(prop,  new Authenticator()
    	{
    		public PasswordAuthentication getPasswordAuthentication()
    		{
    			return new PasswordAuthentication(MailID, MailPW);
    		}
    	});
                
        //Message 객체를 준비한다.
        MimeMessage msg = new MimeMessage(session);
        
        try{            
            
        	System.out.println("sender : " + sender);
        	System.out.println("recipient : " + recipient);
        	System.out.println("contents : " + contents);
        	System.out.println("title : " + title);
        
        	msg.setFrom(new InternetAddress(sender));
        	if(!recipient.isEmpty()) {
        		msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));//받는메일
        		if(!recipientCC.isEmpty()) {
                	msg.setRecipient(Message.RecipientType.CC, new InternetAddress(recipientCC));//참조메일
        		}	
        	}else if(!recipientCC.isEmpty()) {
                msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipientCC));//받는메일
        	}
        		
            
            
            msg.setSentDate(new Date()); 
            msg.setSubject(title, "utf-8");  
            
            // 내용(Text/Html) + 파일 Multipart 전송
            Multipart multipart = new MimeMultipart();
            MimeBodyPart attachPart = null;

            // 내용(Text/Html) 첨부하기
            if (!contents.isEmpty()) {
                attachPart = new MimeBodyPart();
                attachPart.setContent(contents, "text/html; charset=utf-8"); //내용(Text/Html) 첨부하기
                multipart.addBodyPart(attachPart);
            }

            // 파일 첨부하기
            if (! al_attach.isEmpty()) {
                int i = 0;
                for ( String filepass : al_attach ) {
                
                	String fileName = al_attach_name.get(i);
                	
                	attachPart = new MimeBodyPart();
                    attachPart.setDataHandler(new DataHandler(new FileDataSource(new File(filepass))));
                    attachPart.attachFile(filepass);
                    attachPart.setFileName(MimeUtility.encodeText(fileName, "utf-8","B"));
                    attachPart.setHeader("Content-Type", ComUtils.getFileExt(fileName).toLowerCase() + "; name=" + attachPart.getFileName());
                    
                    System.out.println("filepass = ##" + filepass);
                    System.out.println("filename = ##" + fileName);
                    System.out.println("fileext = ##" + ComUtils.getFileExt(fileName).toLowerCase());
                    
                    multipart.addBodyPart(attachPart);
                    
                    i++;
                }
            }
            if (multipart.getCount() > 0) msg.setContent(multipart);
            
            //메일을 전송한다.
            Transport.send(msg);
            System.out.println("######################### : 전송완료");
            
            return true;

        } catch(MessagingException mex) {
            
        	System.out.println("######################### : 전송실패");
        	System.out.println(mex);
            return false;
        } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
    }
}





