package com.jt.service.impl;

import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jt.domain.UploadFileDTO;
import com.jt.mapper.UploadFileMapper;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.FileUtils;
import com.jt.util.ParameterMap;

@Service
public class UploadFileServiceImpl implements UploadFileService {
	
	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	//로그
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UploadFileMapper fileMapper;
	
	//파일등록후 키값을 받아옴
	@Override
	public int insertAndSeq(UploadFileDTO file) {
		
		fileMapper.insert(file);
		return fileMapper.lastSeq();
	}

	//파일등록
	@Override
	public void insert(UploadFileDTO file) {
		
		fileMapper.insert(file);
	}

	//파일 개별 삭제
	@Override
	public void delete(int seq) {
		System.out.println("#### fileDB delete : " + seq);
		fileMapper.delete(seq);
	}
	
	//폴더in파일 및 DB 삭제
	@Override
	public void selectAndDelete(int seq) {
		
		UploadFileDTO fileDTO = select(seq);
		
		//폴더in 파일 삭제
		if(!ComUtils.isEmpty(fileDTO)) {
			FileUtils.delFile(uploadRoot+"/"+fileDTO.getGubun()+"/"+fileDTO.getSave_filename());
		}
		
		//file DB에 파일정보삭제
		delete(seq);
	}
	
		
	
	
	
	
	
	
	
	
	@Override
	public void update_pseq(ParameterMap param) {
		fileMapper.update_pseq(param);
		
	}

	@Override
	public void update_file_size(ParameterMap param) {
		fileMapper.update_file_size(param);
		
	}
	
	@Override
	public void update_save_filename(ParameterMap param) {
		fileMapper.update_save_filename(param);
		
	}

	@Override
	public UploadFileDTO select(int seq) {
		return fileMapper.select(seq);
		
	}

	@Override
	public UploadFileDTO one(int seq) {
		return fileMapper.one(seq);
		
	}

	
	@Override
	public List<UploadFileDTO> list(ParameterMap param){
		return fileMapper.list(param);
		
	}
	
	@Override
	public List<UploadFileDTO> all_list(ParameterMap param){
		return fileMapper.all_list(param);
		
	}
	
	@Override
	public int count(ParameterMap param) {
		return fileMapper.count(param);
		
	}
	
	
	
		//-- 파일을 폴더에 개별 업로드, 파일정보 DB 저장
		@Override
		public int JtFileUpload(String UploadFolder, MultipartFile aFile, String id, Integer key) {
			
			int seq=0 ;
			
			if (!aFile.getOriginalFilename().equals("")) {
				try{
					//-- 파일 업로드
					String UploadBase = ComUtils.getUploadImagePath(uploadRoot+"/"+UploadFolder);
					String filename = aFile.getOriginalFilename();
					String ext = ComUtils.getFileExt(aFile.getOriginalFilename()).toLowerCase();
			   		String save_filename = UploadBase+"/Up_"+String.valueOf(id)+"_"+String.valueOf(key+1)+"_"+ComUtils.getCurDate("timestamp")+"."+ext;
			   		File file = new File(uploadRoot+"/"+UploadFolder, save_filename);
			   		long file_size = aFile.getSize();
					aFile.transferTo(file);
					
					//-- 파일DTO 셋팅	
					UploadFileDTO uploadFileDto = new UploadFileDTO();
					uploadFileDto.setPseq("");
					uploadFileDto.setGubun(UploadFolder);						
					uploadFileDto.setFilename(filename);						
					uploadFileDto.setSave_filename(save_filename);
					uploadFileDto.setFile_size(file_size);
					
					//-- 파일 DB에 저장후 seq를 받아온다.
					seq = insertAndSeq(uploadFileDto); 

				}catch(Exception e){
					log.error(e.getMessage());
				}
			}	

			return seq;
		}
		
		
		
		
		//-- 다중 파일 등록 업로드 process
		public int[] fileUploadMultiInsert(String UploadFolder, List<MultipartFile> fileList, String id) { 
					
			int[] arrFileSeq = new int[fileList.size()]; //파일 업로드 갯수만큽 배열을 만든다.
			for(int i=0; i<fileList.size(); i++) {
				MultipartFile aFile = fileList.get(i);
				//파일 업로드 파일 DB저장
				arrFileSeq[i] = JtFileUpload(UploadFolder, aFile, id, i); 
			}
			return arrFileSeq;
		}			
		
		//-- 다중 파일 수정 업로드 process
		public int[] fileUploadMultiUpdate(String UploadFolder, List<MultipartFile> fileList, Integer[] fileViewSeq, String id) { 
					
			UploadFileDTO fileDTO ;
			
			int[] arrFileSeq = new int[fileList.size()]; //파일 업로드 갯수만큽 배열을 만든다.
			for(int i=0; i<fileList.size(); i++) {
				MultipartFile aFile = fileList.get(i);

				//수정할 파일이 있으면
				if (!aFile.getOriginalFilename().equals("")) {
					//기존데이타 있으면(폴더있는파일삭제,데이타삭제,새파일등록(데이타등록))
					if(fileViewSeq[i]>0) {

						//폴더에 있는 파일 개별 삭제
						fileDTO = select(fileViewSeq[i]);
						FileUtils.delFile(uploadRoot+"/"+UploadFolder+"/"+fileDTO.getSave_filename());
							
						//DB에 파일정보삭제
						delete(fileViewSeq[i]);
					}
					//파일등록(개별등록)
					arrFileSeq[i] = JtFileUpload(UploadFolder, aFile, id, i);
					  
				//수정할 파일이 없으면
				}else {
					//기존데이타 있으면(기존데이타키값을 DTO에 넣는다)//기존데이타 없으면0				
					if(fileViewSeq[i]>0) arrFileSeq[i] = fileViewSeq[i];
					else  arrFileSeq[i] = 0;
				}
			}
			return arrFileSeq;
		}	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
}
