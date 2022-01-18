package com.jt.domain;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.security.core.SpringSecurityCoreVersion;

public class FaqDTO {
	
	private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

	private int seq;
	private String regdate;
	private String isntYn;
	private String question;
	private String answer;
	private String admId;
	
	//private String htmlContents;
	//private String planContents;

	//private int prevSeq;
	//private int nextSeq;
	
	public String getIsntYn() {
		return isntYn;
	}
	public void setIsntYn(String isntYn) {
		this.isntYn = isntYn;
	}
	public String getAdmId() {
		return admId;
	}
	public void setAdmId(String admId) {
		this.admId = admId;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return StringEscapeUtils.unescapeHtml4(answer);
	}
	public void setAnswer(String answer) {
		this.answer = StringEscapeUtils.escapeHtml4(answer);
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "FaqDTO [seq=" + seq + ", regdate=" + regdate + ", isntYn=" + isntYn + ", question=" + question
				+ ", answer=" + answer + ", admId=" + admId + ", getIsntYn()=" + getIsntYn() + ", getAdmId()="
				+ getAdmId() + ", getSeq()=" + getSeq() + ", getRegdate()=" + getRegdate() + ", getQuestion()="
				+ getQuestion() + ", getAnswer()=" + getAnswer() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	//public String getHtmlContents() {
		//	return ComUtils.Replace_Html_Repair(this.answer);
		//}

		//public void setHtmlContents(String htmlContents) {
		//	this.htmlContents = htmlContents;
		//}

		//public String getPlanContents() {
		//	//String removetagContents = this.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		//	String removetagContents = ComUtils.Replace_Html_Repair(this.answer);
		//	return removetagContents.replaceAll("<[^>]*>", "");
		//}
		/*
		public void setPlanContents(String planContents) {
			this.planContents = planContents;
		}
		*/
		/*
		public int getPrevSeq() {
			return prevSeq;
		}

		public void setPrevSeq(int prevSeq) {
			this.prevSeq = prevSeq;
		}

		public int getNextSeq() {
			return nextSeq;
		}

		public void setNextSeq(int nextSeq) {
			this.nextSeq = nextSeq;
		}
		*/
	
	
}
