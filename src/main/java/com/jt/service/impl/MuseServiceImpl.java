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
import com.jt.domain.FrontMuseDTO;
import com.jt.domain.MuseDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.mapper.MuseMapper;
import com.jt.service.MuseService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class MuseServiceImpl implements MuseService {
	
	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Autowired
	private MuseMapper museMapper;
	
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
			museMapper.isntChange(param);
		}

		//-- 리스트
		@Override
		public List<MuseDTO> list(SearchDTO search){
			return museMapper.list(search);
		}

		
		
	
		//-- View
		@Override
		public MuseDTO select(int seq) {
			MuseDTO muse = museMapper.select(seq);
			return muse;
		}
				
				
		//-- 등록 및 수정
		@Override
		public void insertAndUpdate(MuseDTO muse, HttpServletRequest request) {
			
			//-- Lang setting
			String[] arrLang = request.getParameterValues("langArr");
			//if(arrLang != null) 
			muse.setLang(setLangStr(arrLang)); //뒤 부분 '/'를 빼준다. 
			//-- admId setting
			muse.setAdmId(AdminInfo().getAdm_id());
			
			//== 뮤즈 DB 저장
			museMapper.insertAndUpdate(muse);
			
			//== file setting
			//== 등록일때 - muse.seq값을 구해서 fileDB Update를 해준다.
			if(muse.getSeq()<1) {

				int museSeq = museMapper.maxSeq(); //최근 insert된 값
				String tmp_seq = request.getParameter("pseq"); //임시값

				ParameterMap map = new ParameterMap( request );

				//-- KR 파일 업데이트
				map.put("tmp_seq", tmp_seq+"-KR");
				map.put("pseq", museSeq+"-KR");
				fileService.update_pseq(map);
				
				//-- EN 파일 업데이트
				map.put("tmp_seq", tmp_seq+"-EN");
				map.put("pseq", museSeq+"-EN");
				fileService.update_pseq(map);
				
				//-- CN 파일 업데이트
				map.put("tmp_seq", tmp_seq+"-CN");
				map.put("pseq", museSeq+"-CN");
				fileService.update_pseq(map);
			}
		
		}
		
		
		//-- Delete
		@Override
		public void delete(int seq) {
			
			ParameterMap map = new ParameterMap();
			
			map.put("pseq", seq);
			map.put("gubun", "muse");
			
			//==  file 삭제
			for(UploadFileDTO list : fileService.list(map)) {
				fileService.selectAndDelete(list.getSeq());
			}
			
			//==  DB 삭제
			museMapper.delete(seq);
			
		}	
		
		
		
		
		//-- 검색 갯수
		@Override 
		public int count(SearchDTO search) {
			return museMapper.count(search);
			
		}
		
		//-- 데이타 총 갯수
		@Override
		public int totalCount() {
			return museMapper.totalCount();
		}

		//-- isntY 총 갯수
		@Override
		public int isntYCount() {
			return museMapper.isntYCount();
		}
		
		


				

				

		//-- Front 리스트
		@Override
		public List<FrontMuseDTO> Frontlist(String lang,String year){
			ParameterMap map = new ParameterMap();
			map.put("lang", lang);
			map.put("museYear", year);
			return museMapper.Frontlist(map);
		}
		//-- Front 년도 리스트
		@Override
		public List<String> FrontYearlist(String lang){
			return museMapper.FrontYearlist(lang);
		}		

				
	
}
