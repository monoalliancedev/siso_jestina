package com.jt.util;

import java.io.File;
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

public class MailSender_bak {
	//private static Logger log = Logger.getLogger("filelog");
	//private static String METHOD = "MailSender.";

	private String sender;
	private String senderName;
    private String recipient;
    private String title;
    private String contents;
    
    private String err_msg;
    
    public MailSender_bak(){
        //인증에 사용할 기본값을 설정한다.
        sender="kejgogogo@naver.com";
        senderName = "김은정";
        recipient = "kejgogogo@naver.com";
        title = "메일 테스트";
        contents = "내용이 가고 있는거죠?";
        err_msg = "";        
    }
    
    public boolean sendMail(){
        //프로퍼티를 생성한다.
        Properties prop = new Properties();
        
        prop.put("mail.smtp.host", "smtp.naver.com");
        prop.put("mail.smtp.port", 587);
        prop.put("mail.smtp.auth", "true");
        /*
        prop.put("mail.smtp.host", "mail.jestina.com");
        prop.put("mail.smtp.port", 25);
        prop.put("mail.smtp.auth","true");
        */
        
        //세션 인스턴스를 생성한다.
        Session session = Session.getInstance(prop,  new Authenticator()
    	{
    		public PasswordAuthentication getPasswordAuthentication()
    		{
    			return new PasswordAuthentication("kejgogogo", "ab381016@#");
    			//return new PasswordAuthentication("recruit@jestina.com", "jestina7547!!");
    		}
    	});
                
        //Message 객체를 준비한다.
        MimeMessage msg = new MimeMessage(session);
        
        try{            
            //Address 객체를 준비한다.
            InternetAddress from = new InternetAddress(sender);
            InternetAddress to = new InternetAddress(recipient);
                        
            //Message 객체에 정보를 추가한다.
            msg.setFrom(from);

            msg.addRecipient(Message.RecipientType.TO, to);
            msg.setSubject(title, "utf-8");            
            //msg.setText(contents);
            msg.setContent(contents, "text/html; charset=utf-8");
            
            
            /* 파일 첨부하기 */
	        MimeBodyPart attachPart = new MimeBodyPart();
	        attachPart.setDataHandler(new DataHandler("somefile.xml","text/xml"));
	        attachPart.setFileName("XBRL INSTANCE"); // 파일명
	        /* 만약 파일시스템의 파일을 첨부한다면 */
	        attachPart.setDataHandler(new DataHandler(new FileDataSource(new File("somefile.xml"))));
	        
	        MimeBodyPart bodypart = new MimeBodyPart();
	        Multipart multipart = new MimeMultipart();
	        multipart.addBodyPart(bodypart);
	        multipart.addBodyPart(attachPart);
	       
	        msg.setContent(multipart);
	        
            //메일을 전송한다.
            Transport.send(msg);
            System.out.println("######################### : 전송완료");
            //log.debug(METHOD+":MailSend...");
        }catch(MessagingException me){
        	System.out.println("######################### : 전송실패");
        	System.out.println(me);
            //log.error(METHOD+":", me);
            return false;
        }
        return true;
    }

    
    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getErr_msg() {
        return err_msg;
    }
    
}




