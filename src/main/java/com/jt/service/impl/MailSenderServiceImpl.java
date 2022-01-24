package com.jt.service.impl;

import java.io.File;
import java.io.UnsupportedEncodingException;
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
	
	@Autowired
	UploadFileService fileService;
	
	@Autowired
	RecruitmentService recruitService;
	
	//메일셋팅후 메일 전송
	@Override
	public boolean SendMail(MailUploadDTO mailUpload) throws UnsupportedEncodingException {
		
		String sender = "kejgogogo@naver.com"; //보내는 메일(네이비 메일계정을 쓸때는 네이버 메일을 입력해야한다.) 
		String recipients = "kejgogogo@naver.com"; //받는 메일
		String title = "입사신청서"; //메일제목
		String mailText = ""; //메일내용(html)
		
		if(mailUpload.getRecruit()!=null && mailUpload.getRecruit()!="") {
			RecruitmentDTO recruit = recruitService.select(Integer.parseInt(mailUpload.getRecruit()));
			title += " ("  + recruit.getJobField() +")" ;
			mailText += " 모집부분 : "  + recruit.getJobField() +"<br>";
		}
		
		mailText += " 이름 : " + mailUpload.getName() +"<br>";
		mailText += " 핸드폰 : "+ mailUpload.getHp() +"<br>";
		mailText += " 이메일 주소 : " + mailUpload.getEmail() +"<br>";
		mailText += " 지원사유 : <br>" + mailUpload.getContents() +"<br>";	
		
		System.out.println("#### " + mailUpload.getUploadFile().get(0).getOriginalFilename());
		System.out.println("#### " + mailUpload.getUploadFile().get(0).getOriginalFilename());
		
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
		if (MailProc(sender, recipients, title, mailText, al_attach)) {
               System.out.println("FAT = "+sender+" = message sent successfully...");
               mailText = "";
               return true;
        }else {
        	System.out.println("########### 메일 보내기 실패");
        	return false;
        }
	}
	
	
	//메일전송
	@Override
	public boolean MailProc(String sender, String recipient, String title, String contents
							, List<String> al_attach) throws UnsupportedEncodingException {
        
		//프로퍼티를 생성한다.
        Properties prop = new Properties();
        
        prop.put("mail.smtp.host", "smtp.naver.com");
        prop.put("mail.smtp.port", 587);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.mime.charset","utf-8");
        prop.put("mail.mime.encodefilname","true");
       
        
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
            
        	System.out.println("sender : " + sender);
        	System.out.println("recipient : " + recipient);
        	System.out.println("contents : " + contents);
        	System.out.println("title : " + title);
        
        	msg.setFrom(new InternetAddress(sender));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
            msg.setSentDate(new Date());
            msg.setSubject(title, "utf-8");  
            
            // 내용(Text/Html) + 파일 Multipart 전송
            Multipart multipart = new MimeMultipart();
            MimeBodyPart attachPart = null;

            // 내용(Text/Html) 첨부하기
            if (!contents.isEmpty()) {
                attachPart = new MimeBodyPart();
                attachPart.setContent(contents, "text/html; charset=utf-8"); //내용(Text/Html) 첨부하기
                //attachPart.setText(contents, "text/html; charset=utf-8"); //내용(Text/Html) 첨부하기
                multipart.addBodyPart(attachPart);
            }

            // 파일 첨부하기
            if (! al_attach.isEmpty()) {
                for ( String filepass : al_attach ) {
                    attachPart = new MimeBodyPart();
                    attachPart.setDataHandler(new DataHandler(new FileDataSource(new File(filepass))));
                    //uploadRoot+real_filename
                    System.out.println("##" + filepass);
                    multipart.addBodyPart(attachPart);
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
        }
    }
}





