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
import com.jt.domain.BoardJtDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.mapper.BoardJtMapper;
import com.jt.service.BoardJtService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class BoardJtServiceImpl implements BoardJtService {
	
	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Autowired
	private BoardJtMapper boardJtMapper;
	
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
	
	
	//-- isntChange 
	@Override
	public void isntChange(ParameterMap param) {
		boardJtMapper.isntChange(param);
	}

	//리스트
	@Override
	public List<BoardJtDTO> list(SearchDTO search){
		return boardJtMapper.list(search);
	}

	//-- 등록
	@Override
	public void insert(BoardJtDTO boardJt, HttpServletRequest request) {
		
		//-- file (파일업로드후 seq 받아옴-등로)
		int[] arrFileSeq = fileService.fileUploadMultiInsert(boardJt.getGubun(), boardJt.getUploadFile(), AdminInfo().getAdm_id()); //폴더명,List<MultipartFile>파일
		
		//-- Lang setting
		String[] arrLang = request.getParameterValues("langArr");
		//if(arrLang != null) 
		boardJt.setLang(setLangStr(arrLang)); //뒤 부분 '/'를 빼준다. 
		//-- admId setting
		boardJt.setAdmId(AdminInfo().getAdm_id());
		//-- file setting
		if(boardJt.getGubun().equals("news")) { //뉴스 일때만 썸네일이미지 넣어줌
			boardJt.setImgSeq(arrFileSeq[0]);
			boardJt.setFile1Seq(arrFileSeq[1]); 
			boardJt.setFile2Seq(arrFileSeq[2]);
			boardJt.setFile3Seq(arrFileSeq[3]);
			boardJt.setFile4Seq(arrFileSeq[4]);
		}else {
			boardJt.setImgSeq(0);
			boardJt.setFile1Seq(arrFileSeq[0]); 
			boardJt.setFile2Seq(arrFileSeq[1]);
			boardJt.setFile3Seq(arrFileSeq[2]);
			boardJt.setFile4Seq(arrFileSeq[3]);
		}
		//== Mapper
		boardJtMapper.insert(boardJt);
	}
	
	//-- 수정
	@Override
	public void update(BoardJtDTO boardJt, HttpServletRequest request) {

		//-- file (파일업로드후 seq 받아옴-수정)
		int[] arrFileSeq = fileService.fileUploadMultiUpdate(boardJt.getGubun(), boardJt.getUploadFile(), boardJt.getFileViewSeq(),AdminInfo().getAdm_id());
		
		//-- Lang setting
		String[] arrLang = request.getParameterValues("langArr");
		boardJt.setLang(setLangStr(arrLang)); //뒤 부분 '/'를 빼준다. 
		
		//-- admId setting
		boardJt.setAdmId(AdminInfo().getAdm_id());
		//-- file setting
		if(boardJt.getGubun().equals("news")) { //뉴스 일때만 썸네일이미지 넣어줌
			boardJt.setImgSeq(arrFileSeq[0]);
			boardJt.setFile1Seq(arrFileSeq[1]); 
			boardJt.setFile2Seq(arrFileSeq[2]);
			boardJt.setFile3Seq(arrFileSeq[3]);
			boardJt.setFile4Seq(arrFileSeq[4]);
		}else {
			boardJt.setImgSeq(0);
			boardJt.setFile1Seq(arrFileSeq[0]); 
			boardJt.setFile2Seq(arrFileSeq[1]);
			boardJt.setFile3Seq(arrFileSeq[2]);
			boardJt.setFile4Seq(arrFileSeq[3]);
		}
		//== Mapper
		boardJtMapper.update(boardJt);
	}

	
	
	//-- Delete
	@Override
	public void delete(int seq) {
		
		BoardJtDTO board = boardJtMapper.select(seq);
		
		Integer[] fileSeqArray = new Integer[5];
		fileSeqArray[0] = board.getImgSeq();
		fileSeqArray[1] = board.getFile1Seq();
		fileSeqArray[2] = board.getFile2Seq();
		fileSeqArray[3] = board.getFile3Seq();
		fileSeqArray[4] = board.getFile4Seq();
		
		for(int i=0; i<5; i++) {
			//폴더in파일 및 DB 삭제
			if(fileSeqArray[i] > 0) {
				fileService.selectAndDelete(fileSeqArray[i]);
			}
		}
		
		//-- mapper
		boardJtMapper.delete(seq);
	}

	//-- file Delete
	@Override 
	public void fileDelete(ParameterMap param) {
		
		String bseq = param.getString("bseq");
		String gubun = param.getString("gubun");
		String fseq = param.getString("fseq");
		String key = param.getString("key"); //0~4img_seq//file1_seq
		
		System.out.println("######################### bseq : " + bseq);
		System.out.println("######################### gubun : " + gubun);
		System.out.println("######################### fseq : " + fseq);
		System.out.println("######################### key : " + key);
		
		//폴더in파일 및 DB 삭제
		fileService.selectAndDelete(Integer.parseInt(fseq));
		
		//BoardJt DB에 파일정보 수정
		param.put("keyValue",0); 
		boardJtMapper.fileUpdate(param);
	}
	
	//-- View
	@Override
	public BoardJtDTO select(int seq) {
		
		BoardJtDTO board = boardJtMapper.select(seq);
		UploadFileDTO fileDTO;
		String[] fileName = new String[5]; 
		String[] fileSize = new String[5]; 
		Integer[] fileSeqArray = new Integer[5];
		
		fileSeqArray[0] = board.getImgSeq();
		fileSeqArray[1] = board.getFile1Seq();
		fileSeqArray[2] = board.getFile2Seq();
		fileSeqArray[3] = board.getFile3Seq();
		fileSeqArray[4] = board.getFile4Seq();
		
		for(int i=0; i<5; i++) {
			
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
		
		board.setFileViewName(fileName);
		board.setFileViewSize(fileSize);
		board.setFileViewSeq(fileSeqArray);
		
		return board;
	}
	
	
	@Override 
	public int count(SearchDTO search) {
		return boardJtMapper.count(search);
		
	}

	@Override 
	public int totalCount(String gubun) {
		return boardJtMapper.totalCount(gubun);
		
	}

	@Override
	public int max_seq(ParameterMap param) {
		return boardJtMapper.max_seq(param);
		
	}
	
	@Override
	public int isntYCount(String gubun) {
		return boardJtMapper.isntYCount(gubun);
	}
	
	@Override
	public FrontBoardJtDTO MainNews(String lang) {
		return boardJtMapper.MainNews(lang);
	}
	
}
