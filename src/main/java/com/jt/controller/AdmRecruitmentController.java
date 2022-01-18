package com.jt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.jt.domain.FaqDTO;
import com.jt.domain.RecruitmentDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.FaqService;
import com.jt.service.RecruitmentService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmRecruitmentController {
	
	// 권한키값(메인배너관리,메인브랜드배너관리),redirect
	private static final String authorityKey1 = "recruit";
	private static final String authorityKey2 = "faq";
	private static final String authorityHome = "redirect:/jtadm/";
		
	@Autowired
	AdmJtAuthorityService admJtAuthService;
	
	@Autowired
	RecruitmentService recruitmentService;
	
	@Autowired
	FaqService faqService;
	
	
	
	//로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal; 
	}


	//### 게시여부 변경
	@PostMapping(value="/jtadm/recruitment/recruit/recruitIsntYN")
	public ModelAndView recruitIsntYN(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search
			 						, RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		ParameterMap map = new ParameterMap( request );
		recruitmentService.isntChange(map) ;
			
		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/recruitment/recruit/recruitList");
		return mv;
	}
	
	//### 게시여부 Y값이 하나이상인지 체크
	@GetMapping(value="/jtadm/recruitment/recruit/IsntYCount")
	public @ResponseBody int isntYCount() throws Throwable{
		return recruitmentService.isntYCount();
	}
		
	//### 채용공고 리스트
	@GetMapping(value="/jtadm/recruitment/recruit/recruitList")
	public ModelAndView recruitList(@ModelAttribute("search") SearchDTO search, RedirectAttributes ra) throws Throwable{
		
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
		search.setTotal_rows(recruitmentService.count(search)); //search에 총 글수를 넣어준다.
		List<RecruitmentDTO> list = recruitmentService.list(search) ;
		
		mv.addObject("totalCount", recruitmentService.totalCount()); 
		mv.addObject("list", list);		
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			// 전체 low수 
									, ComUtils.objToIntDef(search.getPg_rows(),10)  // 페이지 당 레코드 수 => 없으면 10 
									, ComUtils.objToIntDef(search.getCpage(),1)		// 현재 페이지 => 없으면 1 
									, 10, "이전페이지","다음페이지","첫페이지","마지막페이지","goPage"));
		
		mv.addObject("page", search) ;
		mv.setViewName("/adm/recruitment/recruit/recruitList");
		return mv;
	}
	

	
	//### 채용공고 등록폼(seq=0)/수정폼(seq>0)
	@PostMapping(value="/jtadm/recruitment/recruit/recruit")
	public ModelAndView recruitForm(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search
									, RedirectAttributes ra) throws Throwable {
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		ParameterMap map = new ParameterMap( request );  // request
		String seq = ComUtils.objToStr(map.get("seq"));
		RecruitmentDTO recruit = new RecruitmentDTO();
		
		//채용 등록
		if(seq.equals("0")) {
			recruit.setSeq(0);
			recruit.setIsntYn("N");
			mv.addObject("processKey", "Insert");
		//채용 수정	
		}else{
			recruit = recruitmentService.select(Integer.parseInt(seq));
			mv.addObject("processKey", "Update");
		}
		mv.addObject("recruit", recruit);
		mv.setViewName("/adm/recruitment/recruit/recruit");
		return mv;
	}
	
	//### 채용공고 등록
	@PostMapping(value="/jtadm/recruitment/recruit/recruitProcInsert")
	public ModelAndView recruitProcInsert(RecruitmentDTO recruitmentDTO
										, @ModelAttribute("search") SearchDTO search
										, RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		recruitmentService.insert(recruitmentDTO);
		ra.addFlashAttribute("msg", "insertOK"); //성공여부
		ra.addFlashAttribute("search", search); //검색
		
		mv.setViewName("redirect:/jtadm/recruitment/recruit/recruitList");
		return mv;
	}
		
	//### 채용공고 수정
	@PostMapping(value="/jtadm/recruitment/recruit/recruitProcUpdate")
	public ModelAndView recruitProc(HttpServletRequest request
									, RecruitmentDTO recruitmentDTO , SearchDTO search
									, RedirectAttributes ra ) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		recruitmentService.update(recruitmentDTO);
		ra.addFlashAttribute("msg", "updateOK"); //성공여부
		ra.addFlashAttribute("search", search); //검색
		
		mv.setViewName("redirect:/jtadm/recruitment/recruit/recruitList");
		return mv;
	}	
	
	//### 채용공고 삭제(리스트삭제)
	@PostMapping(value="/jtadm/recruitment/recruit/recruitDel")
	public ModelAndView recruitDel(Integer seq, SearchDTO search
								 , RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		recruitmentService.delete(seq) ;
		ra.addFlashAttribute("msg", "deleteOK"); //성공여부
		ra.addFlashAttribute("search", search); //검색
			
		mv.setViewName("redirect:/jtadm/recruitment/recruit/recruitList");
		return mv;
	}
	
	
	
	
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
	
	
		//### 게시여부 Y값이 하나이상인지 체크
		@GetMapping(value="/jtadm/recruitment/faq/IsntYCount")
		public @ResponseBody int isntYCountFaq() throws Throwable{
			return faqService.isntYCount();
		}
		
		//### 게시여부 변경
		@PostMapping(value="/jtadm/recruitment/faq/faqIsntYN")
		public ModelAndView faqIsntYN(HttpServletRequest request
										, @ModelAttribute("search") SearchDTO search
				 						, RedirectAttributes ra ) throws Throwable{
				
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}

			ParameterMap map = new ParameterMap( request );
				
			faqService.isntChange(map) ;
				
			ra.addFlashAttribute("search", search);
			mv.setViewName("redirect:/jtadm/recruitment/faq/faqList");
			return mv;
		}
	
	
	
	//### FAQ 리스트
	@GetMapping(value="/jtadm/recruitment/faq/faqList")
	public ModelAndView faqList(@ModelAttribute("search") SearchDTO search, RedirectAttributes ra) throws Throwable{
				
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
		 
		search.setTotal_rows(faqService.count(search)); //search에 총 글수를 넣어준다.
		List<FaqDTO> list = faqService.list(search) ;
			
		mv.addObject("totalCount", faqService.totalCount()); 
		mv.addObject("list", list);		
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
										, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
										, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
										, 10, "이전페이지","다음페이지","첫페이지","마지막페이지","goPage"));
		mv.addObject("page", search) ;
			
		mv.setViewName("/adm/recruitment/faq/faqList");
		return mv;
	}
	
	
	//### FAQ 삭제(리스트에서 삭제)
	@PostMapping(value="/jtadm/recruitment/faq/faqDel")
	public ModelAndView faqDel(Integer seq, SearchDTO search
									 , RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		faqService.delete(seq) ;
		ra.addFlashAttribute("msg", "deleteOK"); //성공여부
		ra.addFlashAttribute("search", search); //검색
				
		mv.setViewName("redirect:/jtadm/recruitment/faq/faqList");
		return mv;
	}

	
	//### FAQ 등록폼(seq=0)/수정폼(seq>0)
	@PostMapping(value="/jtadm/recruitment/faq/faq")
	public ModelAndView faqForm(HttpServletRequest request
							, @ModelAttribute("search") SearchDTO search
							, RedirectAttributes ra) throws Throwable{

			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}

			ParameterMap map = new ParameterMap( request );  // request   
			String seq = ComUtils.objToStr(map.get("seq"));
			FaqDTO faq = new FaqDTO();
			
			//FAQ 등록폼
			if(seq.equals("0")) {
				faq.setSeq(0);
				faq.setIsntYn("N");
				mv.addObject("seq", "0");
				mv.addObject("processKey", "Insert");
				
			//FAQ 수정폼	
			}else{
				faq = faqService.select(Integer.parseInt(seq));
				mv.addObject("seq", seq);
				mv.addObject("processKey", "Update");
				mv.addObject("search", search);
			}
			
			mv.addObject("faq", faq);
			mv.setViewName("/adm/recruitment/faq/faq");
			return mv;
		}
		
		//### FAQ 등록
		@PostMapping(value="/jtadm/recruitment/faq/faqProcInsert")
		public ModelAndView faqProcInsert(RedirectAttributes ra
										, SearchDTO search
										, FaqDTO faqDTO) throws Throwable{
			
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}

			faqService.insert(faqDTO);
			
			ra.addFlashAttribute("msg", "insertOK"); //성공여부
			ra.addFlashAttribute("search", search); //검색
			
			mv.setViewName("redirect:/jtadm/recruitment/faq/faqList");
			return mv;
		}
			
		//### FAQ 수정
		@PostMapping(value="/jtadm/recruitment/faq/faqProcUpdate")
		public ModelAndView recruitProc(HttpServletRequest request
										, FaqDTO faqDTO , SearchDTO search
										, RedirectAttributes ra ) throws Throwable {
			// ** 권한 여부에 따른 페이지 이동
			ModelAndView mv = new ModelAndView();
			if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
				ra.addFlashAttribute("msg", "authorityKeyFalse");
				mv.setViewName(authorityHome);
				return mv;
			}
			
			faqService.update(faqDTO);
			
			ra.addFlashAttribute("msg", "updateOK"); //성공여부
			ra.addFlashAttribute("search", search); //검색
			mv.setViewName("redirect:/jtadm/recruitment/faq/faqList");
			return mv;
		}	

}