package com.jt.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.RomasonDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.mapper.RomasonMapper;
import com.jt.service.RomasonService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class RomasonServiceImpl implements RomasonService {
	
	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Autowired
	private RomasonMapper romasonMapper;
	
	@Autowired
	UploadFileService fileService;
	
	//로그
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	//-- 로그인 정보
	public AdmDTO AdminInfo() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal;
	}
	
	
		
		@Override
		public int isntYCount() {
			return romasonMapper.isntYCount();
		}
		
		//-- isntChange 
		@Override
		public void isntChange(ParameterMap param) {
			romasonMapper.isntChange(param);
		}

		//리스트
		@Override
		public List<RomasonDTO> list(SearchDTO search){
			return romasonMapper.list(search);
		}
	
		//-- 등록
		@Override
		public void insertAndUpdate(RomasonDTO romason, HttpServletRequest request) {
			
			int[] arrFileSeq;
			
			//-- file (파일업로드후 seq 받아옴-등록)
			if(romason.getSeq()>0) { //수정 
				//System.out.println("######  수정 : " + popup.getSeq());
				arrFileSeq = fileService.fileUploadMultiUpdate("Product", romason.getUploadFile(), romason.getFileViewSeq(),AdminInfo().getAdm_id());
			}else { //등록
				//System.out.println("######  등록 : ");
				arrFileSeq = fileService.fileUploadMultiInsert("Product", romason.getUploadFile(), AdminInfo().getAdm_id()); //폴더명,List<MultipartFile>파일
			}
			
			
			//-- admId setting
			romason.setAdmId(AdminInfo().getAdm_id());
			//-- file setting
			romason.setProImg1Seq(arrFileSeq[0]);
			romason.setProImg2Seq(arrFileSeq[1]);
			romason.setProImg3Seq(arrFileSeq[2]); 
			romason.setProImg4Seq(arrFileSeq[3]);
			romason.setProImg5Seq(arrFileSeq[4]);
			
			//== Mapper
			romasonMapper.insertAndUpdate(romason);
		}
		
		//-- Delete
		@Override
		public void delete(int seq) {
			
			RomasonDTO romason = romasonMapper.select(seq);
			
			Integer[] fileSeqArray = new Integer[5];
			fileSeqArray[0] = romason.getProImg1Seq();
			fileSeqArray[1] = romason.getProImg2Seq();
			fileSeqArray[2] = romason.getProImg3Seq();
			fileSeqArray[3] = romason.getProImg4Seq();
			fileSeqArray[4] = romason.getProImg5Seq();
			
			for(int i=0; i<5; i++) {
				//폴더in파일 및 DB 삭제
				if(fileSeqArray[i] > 0) {
					fileService.selectAndDelete(fileSeqArray[i]);
				}
			}
			//-- mapper
			romasonMapper.delete(seq);
		}	
		
		//-- file Delete
		@Override 
		public void fileUpdate(ParameterMap param) {
			
			String fseq = param.getString("fseq");
			
			//폴더in파일 및 DB 삭제
			fileService.selectAndDelete(Integer.parseInt(fseq)); //fseq
			
			//DB에 배너정보 수정
			param.put("keyValue",0); //file_seq값을 0으로 업데이트
			romasonMapper.fileUpdate(param); //bseq,key,keyValue
			
		}	
		

	
		//-- View
		@Override
		public RomasonDTO select(int seq) {
			
			RomasonDTO romason = romasonMapper.select(seq);
			UploadFileDTO fileDTO;
			String[] fileName = new String[6]; 
			String[] fileSize = new String[6]; 
			Integer[] fileSeqArray = new Integer[6];
			fileSeqArray[0] = romason.getProImg1Seq();
			fileSeqArray[1] = romason.getProImg2Seq();
			fileSeqArray[2] = romason.getProImg3Seq();
			fileSeqArray[3] = romason.getProImg4Seq();
			fileSeqArray[4] = romason.getProImg5Seq();
			
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
			
			romason.setFileViewName(fileName);
			romason.setFileViewSize(fileSize);
			romason.setFileViewSeq(fileSeqArray);
			
			return romason;
		}
		
		
		@Override 
		public int count(SearchDTO search) {
			return romasonMapper.count(search);
			
		}


		@Override
		public int totalCount() {
			return romasonMapper.totalCount();
		}



		
		
		
		//Front NEW ARRIVALS(추천 신상품) List
		public List<RomasonDTO> FrontNewList() {
			List<RomasonDTO> list = new ArrayList<RomasonDTO>();
			
			for(RomasonDTO romason : romasonMapper.FrontNewList()) {
				UploadFileDTO fileDTO = fileService.select(romason.getProImg1Seq());
				if(!ComUtils.isEmpty(fileDTO)) {
					String[] fileName = new String[1];
					fileName[0] = fileDTO.getSave_filename();
					romason.setFileViewName(fileName);
				}	
				list.add(romason);
			}
			return list;
		}
		
		//Front List
		@Override
		public List<RomasonDTO> FrontList(int category) {
			
			List<RomasonDTO> list = new ArrayList<RomasonDTO>();
			
			for(RomasonDTO romason : romasonMapper.FrontList(category)) {
				UploadFileDTO fileDTO = fileService.select(romason.getProImg1Seq());
				if(!ComUtils.isEmpty(fileDTO)) {
					String[] fileName = new String[1];
					fileName[0] = fileDTO.getSave_filename();
					romason.setFileViewName(fileName);
				}	
				list.add(romason);
			}
			return list;
		}

		
		//-- Front View
		@Override
		public RomasonDTO FrontSelect(ParameterMap param) {
			
			RomasonDTO romason = romasonMapper.FrontSelect(param);
			UploadFileDTO fileDTO;
			String[] fileName = new String[6]; 
			String[] fileSize = new String[6]; 
			Integer[] fileSeqArray = new Integer[6];
			fileSeqArray[0] = romason.getProImg1Seq();
			fileSeqArray[1] = romason.getProImg2Seq();
			fileSeqArray[2] = romason.getProImg3Seq();
			fileSeqArray[3] = romason.getProImg4Seq();
			fileSeqArray[4] = romason.getProImg5Seq();
			
			for(int i=0; i<5; i++) {
				
				System.out.println(fileSeqArray[i]);
				
				if(fileSeqArray[i] > 0) {
					fileDTO = fileService.select(fileSeqArray[i]);
					if(!ComUtils.isEmpty(fileDTO)) {
						fileName[i] = fileDTO.getSave_filename();
						fileSize[i] = Long.toString(fileDTO.getFile_size());	
						fileSeqArray[i] = fileSeqArray[i];
						continue;
					}	
				}
				fileName[i] = "";
				fileSize[i] = "";
				fileSeqArray[i] = 0;
			}
			
			romason.setFileViewName(fileName);
			romason.setFileViewSize(fileSize);
			romason.setFileViewSeq(fileSeqArray);
			
			return romason;
		}		
		
	
}
