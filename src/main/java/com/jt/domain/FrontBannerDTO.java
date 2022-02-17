package com.jt.domain;

import org.apache.commons.text.StringEscapeUtils;
import org.springframework.security.core.SpringSecurityCoreVersion;

public class FrontBannerDTO {

		private static final long serialVersionUID = SpringSecurityCoreVersion.SERIAL_VERSION_UID;

		private int seq;
		private String title;
		private String contents;
		private String molinkUrl;
		private String linkUrl;
		private String linkOutYn;
		private String imgUrl;
		private String moimgUrl;
		private String fileType;
		
		public int getSeq() {
			return seq;
		}
		public void setSeq(int seq) {
			this.seq = seq;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContents() {
			return StringEscapeUtils.unescapeHtml4(contents);
		}
		public void setContents(String contents) {
			this.contents = StringEscapeUtils.escapeHtml4(contents);
		}
		public String getLinkUrl() {
			return linkUrl;
		}
		public void setLinkUrl(String linkUrl) {
			this.linkUrl = linkUrl;
		}
		public String getMolinkUrl() {
			return molinkUrl;
		}
		public void setMolinkUrl(String molinkUrl) {
			this.molinkUrl = molinkUrl;
		}
		public String getLinkOutYn() {
			return linkOutYn;
		}
		public void setLinkOutYn(String linkOutYn) {
			this.linkOutYn = linkOutYn;
		}
		public String getImgUrl() {
			return imgUrl;
		}
		public void setImgUrl(String imgUrl) {
			this.imgUrl = imgUrl;
		}
		public String getMoimgUrl() {
			return moimgUrl;
		}
		public void setMoimgUrl(String moimgUrl) {
			this.moimgUrl = moimgUrl;
		}
		public String getFileType() {
			return fileType;
		}
		public void setFileType(String fileType) {
			this.fileType = fileType;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}
		
		
		
		
}
