package com.jt.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.BrandBannerDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.mapper.BrandBannerMapper;
import com.jt.service.BrandBannerService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class BrandBannerServiceImpl implements BrandBannerService {
	
	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Autowired
	private BrandBannerMapper brandBannerMapper;
	
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
		
		
		
		
		//-- file Delete
		@Override 
		public void fileUpdate(ParameterMap param) {
			
			String fseq = param.getString("fseq");

			//폴더in파일 및 DB 삭제
			fileService.selectAndDelete(Integer.parseInt(fseq)); //fseq
			
			//DB에 배너정보 수정
			param.put("keyValue",0); //file_seq값을 0으로 업데이트
			brandBannerMapper.fileUpdate(param); //bseq,key,keyValue
			
			System.out.println("#########################");
			
		}	
		
		@Override
		public BrandBannerDTO list(BrandBannerDTO tmpBanner) {

			BrandBannerDTO banner = brandBannerMapper.list(tmpBanner);

			UploadFileDTO fileDTO;
			String[] fileName = new String[2]; 
			String[] fileSize = new String[2]; 
			Integer[] fileSeqArray = new Integer[2];
			
			if(!ComUtils.isEmpty(banner)) {
				fileSeqArray[0] = banner.getImgKrSeq();
				fileSeqArray[1] = banner.getMoimgKrSeq();
				
				for(int i=0; i<2; i++) {
					
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
		public void BBannerProc(BrandBannerDTO banner) {
			
			//System.out.println("service ###################################### : "+banner.getSeq());
			
			int[] arrFileSeq;
			
			//-- file (파일업로드후 seq 받아옴-등록)
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

			//== Mapper
			brandBannerMapper.BBannerProc(banner);
			
		}
	


		@Override		
		public FrontBannerDTO FrontSelect(ParameterMap param) {
			return brandBannerMapper.FrontSelect(param);	
		}
	
}
