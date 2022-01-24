package com.jt.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.BannerDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.mapper.BannerMapper;
import com.jt.service.BannerService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class BannerServiceImpl implements BannerService {
	
	@Autowired
	private BannerMapper bannerMapper;
	
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
		
		
				//-- sortChange 
				@Override
				public void sortChange(ParameterMap param) {
					
					String changeSeq = param.getString("changeSeq");
					String changeKey = param.getString("changeKey");
					
					BannerDTO banner = bannerMapper.select(Integer.parseInt(changeSeq));
					int sortIdx = banner.getSortIdx();
					String gubun = banner.getGubun();
					
					if(changeKey.equals("Up") || changeKey.equals("Down")) {
					
						//CHANGE 할 데이타 구함
						param.put("sortIdx", sortIdx);
						param.put("gubun", gubun);
						
						System.out.println(sortIdx+","+gubun);
						
						if(changeKey.equals("Up")) {
							banner = bannerMapper.UpSelect(param);
						}else{
							banner = bannerMapper.DownSelect(param);
						}
						
						//CHANGE
						param.put("seq", changeSeq);
						param.put("sortIdx", banner.getSortIdx());
						bannerMapper.sortChange(param);
						
						param.put("seq", banner.getSeq()); //up,down교체할 키값
						param.put("sortIdx", sortIdx);
						bannerMapper.sortChange(param);
					}	
				}
				
		//-- isntChange 
		@Override
		public void isntChange(ParameterMap param) {
			bannerMapper.isntChange(param);
		}

		//리스트
		@Override
		public List<BannerDTO> list(SearchDTO search){
			return bannerMapper.list(search);
		}
	
		//-- 등록
		@Override
		public void insert(BannerDTO banner, HttpServletRequest request) {
			
			//-- file (파일업로드후 seq 받아옴-등로)
			int[] arrFileSeq = fileService.fileUploadMultiInsert(banner.getGubun(), banner.getUploadFile(), AdminInfo().getAdm_id()); //폴더명,List<MultipartFile>파일
			
			//-- Lang setting
			String[] arrLang = request.getParameterValues("langArr");
			//if(arrLang != null) 
			banner.setLang(setLangStr(arrLang)); //뒤 부분 '/'를 빼준다. 
			//-- admId setting
			banner.setAdmId(AdminInfo().getAdm_id());
			//-- file setting
			banner.setImgKrSeq(arrFileSeq[0]);
			banner.setMoimgKrSeq(arrFileSeq[1]);
			banner.setImgEnSeq(arrFileSeq[2]); 
			banner.setMoimgEnSeq(arrFileSeq[3]);
			banner.setImgCnSeq(arrFileSeq[4]);
			banner.setMoimgCnSeq(arrFileSeq[5]);

			//== Mapper
			bannerMapper.insert(banner);
		}
		
		//-- 수정
		@Override
		public void update(BannerDTO banner, HttpServletRequest request) {

			//-- file (파일업로드후 seq 받아옴-수정)
			int[] arrFileSeq = fileService.fileUploadMultiUpdate(banner.getGubun(), banner.getUploadFile(), banner.getFileViewSeq(),AdminInfo().getAdm_id());
			
			//-- Lang setting
			String[] arrLang = request.getParameterValues("langArr");
			banner.setLang(setLangStr(arrLang)); //뒤 부분 '/'를 빼준다. 
			
			//-- admId setting
			banner.setAdmId(AdminInfo().getAdm_id());
			//-- file setting
			banner.setImgKrSeq(arrFileSeq[0]);
			banner.setMoimgKrSeq(arrFileSeq[1]);
			banner.setImgEnSeq(arrFileSeq[2]); 
			banner.setMoimgEnSeq(arrFileSeq[3]);
			banner.setImgCnSeq(arrFileSeq[4]);
			banner.setMoimgCnSeq(arrFileSeq[5]);

			//== Mapper
			bannerMapper.update(banner);
		}
		
		
		//-- Delete
		@Override
		public void delete(int seq) {
			
			BannerDTO banner = bannerMapper.select(seq);
			
			Integer[] fileSeqArray = new Integer[6];
			fileSeqArray[0] = banner.getImgKrSeq();
			fileSeqArray[1] = banner.getMoimgKrSeq();
			fileSeqArray[2] = banner.getImgEnSeq();
			fileSeqArray[3] = banner.getMoimgEnSeq();
			fileSeqArray[4] = banner.getImgCnSeq();
			fileSeqArray[5] = banner.getMoimgCnSeq();
			
			for(int i=0; i<6; i++) {
				//폴더in파일 및 DB 삭제
				if(fileSeqArray[i] > 0) {
					fileService.selectAndDelete(fileSeqArray[i]);
				}
			}
			//-- mapper
			bannerMapper.delete(seq);
		}	
		
		//-- file Delete
		@Override 
		public void fileDelete(ParameterMap param) {
			
			//String bseq = param.getString("bseq");
			String fseq = param.getString("fseq");
			//String key = param.getString("key"); //0~4img_seq//file1_seq
			
			//System.out.println("######################### bseq : " + bseq);
			//System.out.println("######################### fseq : " + fseq);
			//System.out.println("######################### key : " + key);
			
			//폴더in파일 및 DB 삭제
			fileService.selectAndDelete(Integer.parseInt(fseq)); //fseq
			
			//DB에 배너정보 수정
			param.put("keyValue",0); //file_seq값을 0으로 업데이트
			bannerMapper.fileUpdate(param); //bseq,key,keyValue
			
			System.out.println("#########################");
			
		}	
		

	
		//-- View
		@Override
		public BannerDTO select(int seq) {
			
			BannerDTO banner = bannerMapper.select(seq);
			UploadFileDTO fileDTO;
			String[] fileName = new String[6]; 
			String[] fileSize = new String[6]; 
			Integer[] fileSeqArray = new Integer[6];
			fileSeqArray[0] = banner.getImgKrSeq();
			fileSeqArray[1] = banner.getMoimgKrSeq();
			fileSeqArray[2] = banner.getImgEnSeq();
			fileSeqArray[3] = banner.getMoimgEnSeq();
			fileSeqArray[4] = banner.getImgCnSeq();
			fileSeqArray[5] = banner.getMoimgCnSeq();
			
			for(int i=0; i<6; i++) {
				
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
			
			banner.setFileViewName(fileName);
			banner.setFileViewSize(fileSize);
			banner.setFileViewSeq(fileSeqArray);
			
			return banner;
		}
		
		
		@Override 
		public int count(SearchDTO search) {
			return bannerMapper.count(search);
			
		}
		
		@Override 
		public int totalCount(String gubun) {
			return bannerMapper.totalCount(gubun);
			
		}

		@Override
		public int max_seq(ParameterMap param) {
			return bannerMapper.max_seq(param);
			
		}
		
		
		
		
		
				//-- 메인브랜드베너 View
				@Override
				public BannerDTO selectGubun(String gubun) {
					
					BannerDTO banner = bannerMapper.selectGubun(gubun);
					
					
					UploadFileDTO fileDTO;
					String[] fileName = new String[6]; 
					String[] fileSize = new String[6]; 
					Integer[] fileSeqArray = new Integer[6];
					
					if(!ComUtils.isEmpty(banner)) {
						fileSeqArray[0] = banner.getImgKrSeq();
						fileSeqArray[1] = banner.getMoimgKrSeq();
						fileSeqArray[2] = banner.getImgEnSeq();
						fileSeqArray[3] = banner.getMoimgEnSeq();
						fileSeqArray[4] = banner.getImgCnSeq();
						fileSeqArray[5] = banner.getMoimgCnSeq();
					
					
						for(int i=0; i<6; i++) {
							
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
						
						banner.setFileViewName(fileName);
						banner.setFileViewSize(fileSize);
						banner.setFileViewSeq(fileSeqArray);
					}
					
					
					return banner;
				}


				@Override
				public void MBBannerProc(BannerDTO banner) {
					
					//System.out.println("service ###################################### : "+banner.getSeq());
					
					int[] arrFileSeq;
					
					//-- file (파일업로드후 seq 받아옴-등로)
					if(banner.getSeq()>0) { //수정 
						System.out.println("######  수정 : " + banner.getSeq());
						arrFileSeq = fileService.fileUploadMultiUpdate(banner.getGubun(), banner.getUploadFile(), banner.getFileViewSeq(),AdminInfo().getAdm_id());
					}else { //등록
						System.out.println("######  등록 : ");
						arrFileSeq = fileService.fileUploadMultiInsert(banner.getGubun(), banner.getUploadFile(), AdminInfo().getAdm_id()); //폴더명,List<MultipartFile>파일	
					}
					
					//-- admId setting
					banner.setAdmId(AdminInfo().getAdm_id());
					//-- file setting
					banner.setImgKrSeq(arrFileSeq[0]);
					banner.setMoimgKrSeq(arrFileSeq[1]);
					banner.setImgEnSeq(arrFileSeq[2]); 
					banner.setMoimgEnSeq(arrFileSeq[3]);
					banner.setImgCnSeq(arrFileSeq[4]);
					banner.setMoimgCnSeq(arrFileSeq[5]);

					//== Mapper
					bannerMapper.MBBannerProc(banner);
					
				}

				@Override
				public int isntYCount(String gubun) {
					return bannerMapper.isntYCount(gubun);
				}
				
				
				
				
				
				
				
				
			public List<FrontBannerDTO> MainBanner(String lang) {
				return bannerMapper.MainBanner(lang);
			}
			public FrontBannerDTO MainBarndBanner(ParameterMap param){
				return bannerMapper.MainBarndBanner(param);
			}
				
				
				
				
				
				
		
	
}
