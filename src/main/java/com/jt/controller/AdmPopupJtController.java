package com.jt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jt.domain.AdmDTO;
import com.jt.domain.PopupJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.PopupService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmPopupJtController {
	
	// 권한키값(팝업),redirect
	private static final String authorityKey = "Mpopup";
	private static final String authorityHome = "redirect:/jtadm/";
		
	@Autowired
	AdmJtAuthorityService admJtAuthService;
	
	@Autowired
	PopupService popupService;
	
	@Autowired
	UploadFileService fileService;
	
	
		//로그인 정보
		@ModelAttribute("authAdm")
		public AdmDTO getAuthAdm() {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			return (AdmDTO)principal; 
		}

		
		//### 게시여부 변경
		@PostMapping(value="/jtadm/basic/Mpopup/IsntYN")
		public ModelAndView popupIsntYN(HttpServletRequest request
										, @ModelAttribute("search") SearchDTO search
										, RedirectAttributes ra ) throws Throwable{
			
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			ParameterMap map = new ParameterMap( request );
			
			String gubun="Mpopup";	
			map.put("gubun" , gubun);
			popupService.isntChangePopup(map) ;
				
			ra.addFlashAttribute("search", search);
			mv.setViewName("redirect:/jtadm/basic/Mpopup/list");
			
			return mv;
		}
		
		
		//### 리스트
		@GetMapping(value="/jtadm/basic/Mpopup/list")
		public ModelAndView popupList(@ModelAttribute("search") SearchDTO search
									, RedirectAttributes ra) throws Throwable{
				
			// ** 권한 여부에 따른 페이지 이동
						ModelAndView mv = new ModelAndView();
						if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
							ra.addFlashAttribute("msg", "authorityKeyFalse");
							mv.setViewName(authorityHome);
							return mv;
						}
						
			
			String gubun="Mpopup";	
			search.setKeyGubun(gubun);
			
			search.setTotal_rows(popupService.count(search));
			List<PopupJtDTO> list = popupService.list(search) ;
				
			mv.addObject("totalCount", popupService.totalCount()); 
			mv.addObject("list", list);		
			mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
										, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
										, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
										, 10, "이전페이지","다음페이지","첫페이지","마지막페이지","goPage"));
			mv.addObject("page", search) ;
			mv.setViewName("/adm/basic/Mpopup/list");
			return mv;
		}	
		
		
		//== 등록폼(seq=0)/수정폼(seq>0)
		@PostMapping(value="/jtadm/basic/Mpopup/view")
		public ModelAndView popupForm(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search					
									, RedirectAttributes ra) throws Throwable{
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
						
			PopupJtDTO popup = new PopupJtDTO();
			ParameterMap map = new ParameterMap( request );  // request
			String seq = ComUtils.objToStr(map.get("seq"));
			
			//등록
			if(seq.equals("0")) {
				popup.setSeq(0);
				popup.setIsntYn("N");
				popup.setPopscrollYn("N");
				mv.addObject("processKey", "Insert");
			//수정	
			}else{
				popup = popupService.select(Integer.parseInt(seq));
				mv.addObject("processKey", "Update");
			}
			
			mv.addObject("popup", popup);
			mv.setViewName("/adm/basic/Mpopup/view");
			return mv;
		}
		
		
		//### 등록, 수정 Proc
		@PostMapping(value="/jtadm/basic/Mpopup/Proc")
		public ModelAndView popupProc(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search	
									, PopupJtDTO popup 
									, RedirectAttributes ra ) throws Throwable{
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			//-- Service 호출
			popupService.insertAndUpdate(popup, request);
			
			//-- mv,ra
			if(popup.getSeq()>0) {
				ra.addFlashAttribute("msg", "updateOK"); //성공여부
			}else {
				ra.addFlashAttribute("msg", "insertOK"); //성공여부
			}
			ra.addFlashAttribute("search", search); //검색
			mv.setViewName("redirect:/jtadm/basic/Mpopup/list");
			return mv;
		}
		
		
		//### 삭제(리스트,수정폼에서  삭제)
		@PostMapping(value="/jtadm/basic/Mpopup/Del")
		public ModelAndView popupDel(Integer seq, SearchDTO search
									, RedirectAttributes ra ) throws Throwable{
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			popupService.delete(seq) ;
			ra.addFlashAttribute("msg", "deleteOK"); //성공여부
			ra.addFlashAttribute("search", search); //검색
				
			mv.setViewName("redirect:/jtadm/basic/Mpopup/list");
			return mv;
		}
		
		
		//### 삭제(수정폼에서 파일 개별 삭제)
		@GetMapping(value="/jtadm/basic/Mpopup/fileDel")
		public @ResponseBody String FileDel(HttpServletRequest request) throws Throwable{
					
			ParameterMap map = new ParameterMap( request );
					
			popupService.fileDeletePopup(map);
					
			//성공했을때
			JSONObject jsonData = new JSONObject();
			jsonData.put("key", map.getString("key")); //파일위치(0~4)

			return jsonData.toString();		
		}
		
		
		//### 게시여부 Y값이 하나이상인지 체크
		@GetMapping(value="/jtadm/basic/Mpopup/IsntYCount")
		public @ResponseBody int isntYCount() throws Throwable{
			return popupService.isntYCount();
		}

}








