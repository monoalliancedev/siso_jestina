package com.jt.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.FrontPopupJtDTO;
import com.jt.domain.PopupJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.mapper.PopupMapper;
import com.jt.service.PopupService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class PopupServiceImpl implements PopupService {

	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Autowired
	private PopupMapper popupMapper;
	
	@Autowired
	UploadFileService fileService;
	
	//로그
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	//-- 로그인 정보
	public AdmDTO AdminInfo() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal;
	}
	
	
	//-- Lang
	public String setLangStr(String[] arrLang) {
				
		String lang="";
		if(arrLang != null) {
			if(arrLang.length>0) {
				for (int i = 0 ; i < arrLang.length; i++) {
					if(!arrLang[i].equals("")) lang += ComUtils.objToStr(arrLang[i]) +"/"; //KR/EN/CN/ 
				}
				lang = lang.substring(0,lang.length()-1); //뒤 부분 '/'를 빼준다.
			}
		}	
		return lang; 
	}
			
	//-- 리스트
	@Override
	public List<PopupJtDTO> list(SearchDTO search) {
		return popupMapper.list(search);
	}
	//-- 등록 및 수정
	@Override
	public void insertAndUpdate(PopupJtDTO popup, HttpServletRequest request) {
		
		int[] arrFileSeq;
		
		//-- file (파일업로드후 seq 받아옴-등록)
		if(popup.getSeq()>0) { //수정 
			//System.out.println("######  수정 : " + popup.getSeq());
			arrFileSeq = fileService.fileUploadMultiUpdate("Mpopup", popup.getUploadFile(), popup.getFileViewSeq(),AdminInfo().getAdm_id());
		}else { //등록
			//System.out.println("######  등록 : ");
			arrFileSeq = fileService.fileUploadMultiInsert("Mpopup", popup.getUploadFile(), AdminInfo().getAdm_id()); //폴더명,List<MultipartFile>파일
		}
		
		
		//-- Lang setting
		String[] arrLang = request.getParameterValues("langArr");
		//if(arrLang != null) 
		popup.setLang(setLangStr(arrLang)); //뒤 부분 '/'를 빼준다. 
		//-- admId setting
		popup.setAdmId(AdminInfo().getAdm_id());
		//-- file setting
		popup.setImgKrSeq(arrFileSeq[0]);
		popup.setImgEnSeq(arrFileSeq[1]); 
		popup.setImgCnSeq(arrFileSeq[2]);
		
		//== Mapper
		popupMapper.insertAndUpdate(popup);
	}


	@Override
	public void delete(int seq) {
		PopupJtDTO popup = popupMapper.select(seq);
		
		Integer[] fileSeqArray = new Integer[3];
		fileSeqArray[0] = popup.getImgKrSeq();
		fileSeqArray[1] = popup.getImgEnSeq();
		fileSeqArray[2] = popup.getImgCnSeq();
		
		for(int i=0; i<3; i++) {
			//폴더in파일 및 DB 삭제
			if(fileSeqArray[i] > 0) {
				fileService.selectAndDelete(fileSeqArray[i]);
			}
		}
		//-- mapper
		popupMapper.delete(seq);
	}


	@Override
	public PopupJtDTO select(int seq) {
		
		PopupJtDTO popup = popupMapper.select(seq);
		UploadFileDTO fileDTO;
		String[] fileName = new String[6]; 
		String[] fileSize = new String[6]; 
		Integer[] fileSeqArray = new Integer[6];
		fileSeqArray[0] = popup.getImgKrSeq();
		fileSeqArray[1] = popup.getImgEnSeq();
		fileSeqArray[2] = popup.getImgCnSeq();
		
		for(int i=0; i<3; i++) {
			
			System.out.println(fileSeqArray[i]);
			
			if(fileSeqArray[i] > 0) {
				fileDTO = fileService.select(fileSeqArray[i]);
				if(!ComUtils.isEmpty(fileDTO)) {
					fileName[i] = fileDTO.getFilename();
					fileSize[i] = Long.toString(fileDTO.getFile_size());	
					fileSeqArray[i] = fileSeqArray[i];
					continue;
				}	
			}
			fileName[i] = "";
			fileSize[i] = "";
			fileSeqArray[i] = 0;
		}
		
		popup.setFileViewName(fileName);
		popup.setFileViewSize(fileSize);
		popup.setFileViewSeq(fileSeqArray);
		
		return popup;
	}


	@Override
	public int count(SearchDTO search) {
		return popupMapper.count(search);
	}


	@Override
	public void isntChangePopup(ParameterMap param) {
		popupMapper.isntChangePopup(param);
	}


	@Override
	public void fileDeletePopup(ParameterMap param) {

		String fseq = param.getString("fseq");
		
		//폴더in파일 및 DB 삭제
		fileService.selectAndDelete(Integer.parseInt(fseq)); //fseq
		
		//DB에 배너정보 수정
		param.put("keyValue",0); //file_seq값을 0으로 업데이트
		popupMapper.fileUpdatePopup(param); //bseq,key,keyValue
		
		System.out.println("#########################");
		
	}


	@Override
	public int isntYCount() {
		return popupMapper.isntYCount();
	}
	
	@Override 
	public int totalCount() {
		return popupMapper.totalCount();
		
	}
	
	
	
			
	
	@Override
	public List<FrontPopupJtDTO> MainPopup(String lang){
		return popupMapper.MainPopup(lang);
	}
}
