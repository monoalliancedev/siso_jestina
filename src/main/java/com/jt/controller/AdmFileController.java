package com.jt.controller;
import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.jt.domain.AdmDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.FileValidator;
import com.jt.util.ParameterMap;


@Controller  
public class AdmFileController {   
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;
	
	@Autowired  
	FileValidator fileValidator;   

	@Autowired
	UploadFileService ufService;

	@GetMapping("/jtadm/jtcommon/uploadFileForm")   
	public ModelAndView uploadFileForm(HttpServletRequest request) throws Throwable{
		
		ParameterMap map = new ParameterMap( request );
		
		String pseq = map.getString("pseq");
		String gubun = map.getString("gubun");
		String key = map.getString("key");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/adm/jtcommon/uploadFileForm");
		mv.addObject("pseq", pseq);
		mv.addObject("gubun", gubun);
		mv.addObject("key", key);
		
		return mv;   
	}   
  	
	
	@PostMapping(value="/jtadm/jtcommon/uploadFileProc")
	public ModelAndView uploadFileProc(HttpServletRequest request
									, @RequestParam(value="attach_files", required = false) MultipartFile attach_files ){ 
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AdmDTO adm = (AdmDTO)principal; 
		
		int idx = 0;
		ParameterMap map = new ParameterMap( request );
		String pseq = map.getString("pseq");
		String gubun = map.getString("gubun");
		String key = map.getString("key");
		//System.out.println("####################"+uploadRoot);
		
		//System.out.println("1 ####################"+UploadBase);
		
		//파일업로드
		MultipartFile aFile = attach_files;
		
		if (!aFile.getOriginalFilename().equals("")) {
				try{
					String UploadBase = ComUtils.getUploadImagePath(uploadRoot+"/"+gubun);
					
					idx++;
	        		String filename = aFile.getOriginalFilename();
					String ext = ComUtils.getFileExt(aFile.getOriginalFilename()).toLowerCase();
	        		String save_filename = UploadBase+"/Up_"+String.valueOf(adm.getAdm_id())+"_"+String.valueOf(idx)+"_"+ComUtils.getCurDate("timestamp")+"."+ext;
	        		
	        		File file = new File(uploadRoot+"/"+gubun, save_filename);
	        		long file_size = aFile.getSize();
					aFile.transferTo(file);
					
					UploadFileDTO uploadFileDto = new UploadFileDTO();
					uploadFileDto.setGubun(gubun);	
					uploadFileDto.setPseq(pseq+"-"+key);
					uploadFileDto.setFilename(filename);						
					uploadFileDto.setSave_filename(save_filename);
					uploadFileDto.setFile_size(file_size);
					//파일 DB 등록
					ufService.insert(uploadFileDto);
					
					//log.info(uploadRoot+"/"+save_filename);
	        		//log.info(uploadRoot+"/"+filename);		        		
				}catch(Exception e){
					log.error(e.getMessage());
				}
		}         
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/adm/jtcommon/uploadFileProc");
		mv.addObject("pseq", pseq); //상품키값
		mv.addObject("key", key);
		mv.addObject("gubun", gubun);
		
		
		return mv;
		
	}
	
	@GetMapping(value="/jtadm/jtcommon/getAttachFiles")
	public @ResponseBody String getAttachFiles(HttpServletRequest request) throws Throwable{
		
		JSONObject jsonData = new JSONObject();
		
		ParameterMap map = new ParameterMap( request );  // request
		String pseq = map.getString("pseq") + "-" + map.getString("key");
		map.put("pseq", pseq);
		List<UploadFileDTO> list = ufService.list(map) ;

		ufService.list(map);
		jsonData.put("rs", "Y");
		jsonData.put("msg", "");
		jsonData.put("list", list);
		return jsonData.toString();		

	}	
	
	
	

	@PostMapping(value="/jtadm/jtcommon/uploadFileDel")
	public @ResponseBody String uploadFileDel(HttpServletRequest request) throws Throwable{
		JSONObject jsonData = new JSONObject();
		
		ParameterMap map = new ParameterMap( request );				
		int seq = map.getInt("seq");
		//keyString key = map.getString("key");
		
		if (seq > 0) {
			ufService.delete(seq);		
			jsonData.put("rs", "Y");
		}else {
			jsonData.put("rs", "N");
		}
		//jsonData.put("key", key);
		
		return jsonData.toString();		

	}
		
	

		
	
	
	
	
	
	
	

	
	@GetMapping("/jtadm/jtcommon/photo_uploader")   
	public ModelAndView photo_uploader(HttpServletRequest request) throws Throwable{
		ParameterMap map = new ParameterMap( request );
		String gubun = map.getString("gubun");
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/adm/jtcommon/photo_uploader");
		mv.addObject("gubun", gubun);
		
		return mv;   
	}   

	
	@PostMapping(value="/jtadm/jtcommon/photo_uploader")
	public RedirectView photoUploader(HttpServletRequest request,
			@RequestParam(value="Filedata", required = false) MultipartFile Filedata ){ 
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AdmDTO adm = (AdmDTO)principal; 
		
		ParameterMap map = new ParameterMap( request );
		String save_filename = "";
		String org_filename = "";
		
		String UploadBase = ComUtils.getUploadImagePath(uploadRoot+"/editor");
		
		if (Filedata != null){
			if (!Filedata.getOriginalFilename().equals("")) {    					
				try{	
					org_filename = Filedata.getOriginalFilename();
					String ext = ComUtils.getFileExt(Filedata.getOriginalFilename()).toLowerCase();
					save_filename = UploadBase+"/"+adm.getAdm_id()+"_"+ComUtils.getCurDate("timestamp")+"."+ext;
					File file = new File(uploadRoot+"/editor", save_filename);
					Filedata.transferTo(file);
				}catch(Exception e){
					log.error(e.getMessage());
				}
			}
		}		

		String redirect_url = "/editor/SE/photo_uploader/popup/callback.html?callback_func="+map.getString("callback_func");
		redirect_url += "&bNewLine=true";
		redirect_url += "&sFileName="+org_filename;
		redirect_url += "&sFileURL=/UploadFiles/editor/"+save_filename;
		
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(redirect_url);
		return redirectView;		
		
	}
}  
