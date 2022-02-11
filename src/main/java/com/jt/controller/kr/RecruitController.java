package com.jt.controller.kr;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jt.domain.FaqDTO;
import com.jt.domain.MailUploadDTO;
import com.jt.domain.RecruitmentDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.FaqService;
import com.jt.service.MailSenderService;
import com.jt.service.RecruitmentService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;


@Controller("RecruitController")
public class RecruitController {

	@Autowired
	RecruitmentService recruitService;
	
	@Autowired
	FaqService faqService;
	
	@Autowired
	MailSenderService mailSender;
	
	
	private static final String SiteLang= "KR";
	private static final String SiteFolder= "kr";
		
	//-- recruit / 인재상
	@GetMapping(value="/recruit/talent")
	public ModelAndView talent() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/"+SiteFolder+"/recruit/talent"); 
		return mv;
	}
	
	//-- recruit / 직무소개
	@GetMapping(value="/recruit/recruitIntroduce")
	public ModelAndView recruitIntroduce() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/"+SiteFolder+"/recruit/recruitIntroduce"); 
		return mv;
	}
	
	//-- recruitCulture / 기업문화/복리후생
	@GetMapping(value="/recruit/recruitCulture")
	public ModelAndView recruitCulture() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/"+SiteFolder+"/recruit/recruitCulture"); 
		return mv;
	}
	
	//-- recruit / 채용공고
	@GetMapping(value="/recruit/recruit")
	public ModelAndView recruit(String code,@ModelAttribute("search") SearchDTO search) throws Throwable {

		//총갯수,경력갯수,신입갯수
		int totCntY = recruitService.FrontTotalCnt("Y");
		int totCntN = recruitService.FrontTotalCnt("N");
		int totCntA = totCntY + totCntN;
		
		//채용정보 리스트(전체정보)
		List<RecruitmentDTO> recruitList = recruitService.FrontList(code) ;
		
		//faq 리스트(전체정보)
		search.setKeyIsnt("Y");
		search.setTotal_rows(faqService.count(search)); //search에 총 글수를 넣어준다.
		List<FaqDTO> faqList = faqService.list(search);
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("toDay", ComUtils.getCurDate("ymd")); 
		mv.addObject("code", code); 
		mv.addObject("totCntA", totCntA); 
		mv.addObject("totCntY", totCntY); 
		mv.addObject("totCntN", totCntN); 
		mv.addObject("recruitList", recruitList);		
		mv.addObject("faqList", faqList);		
		mv.addObject("page", search) ;
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
										, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
										, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
										, 10
										, "/images/common/icon_paging_prev.svg"
										, "/images/common/icon_paging_next.svg"
										, "/images/common/icon_paging_first.svg"
										, "/images/common/icon_paging_last.svg"
										, "goPage"));
		mv.setViewName("/"+SiteFolder+"/recruit/recruitList"); 
		return mv;
	}
	
	//-- recruit / 채용공고 상세보기
	@GetMapping(value="/recruit/recruitView")
	public ModelAndView recruitView(int code) throws Throwable {

		RecruitmentDTO recruit = new RecruitmentDTO();
		recruit = recruitService.select(code);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("toDay", ComUtils.getCurDate("ymd")); 
		mv.addObject("recruit", recruit);
		mv.addObject("code", code);
		mv.setViewName("/"+SiteFolder+"/recruit/recruitView"); 
		return mv;
	}
	
	
		//-- recruit / 인재풀등록
		@GetMapping(value="/recruit/recruitResources")
		public ModelAndView recruitResources() throws Throwable {

			ModelAndView mv = new ModelAndView();
			mv.setViewName("/"+SiteFolder+"/recruit/recruitResources"); 
			return mv;
		}
		
		//-- recruit / 입사지원
		@GetMapping(value="/recruit/application")
		public ModelAndView application(String code) throws Throwable {

			String recruitMode = "";
			
			String recruitJobField="";
			if( code == null ) {
				
			}else {
				RecruitmentDTO recruit = recruitService.select(Integer.parseInt(code));
				recruitJobField = recruit.getJobField();
			}
			
			//채용정보 리스트(전체정보)
			List<RecruitmentDTO> recruitList = recruitService.FrontList(recruitMode) ;
					
			ModelAndView mv = new ModelAndView();
			mv.addObject("toDay", ComUtils.getCurDate("ymd")); 
			mv.addObject("code", code);		
			mv.addObject("recruitList", recruitList);		
			mv.addObject("recruitJobField", recruitJobField);		
			
			mv.setViewName("/"+SiteFolder+"/recruit/application"); 
			return mv;
		}
		
		
		
		
		//-- recruit / 입사지원 메일보내기
		@PostMapping(value = "/recruit/MailSend")
		public ModelAndView MailSend(MailUploadDTO mailUpload , RedirectAttributes ra) throws Throwable {

			if(mailSender.SendMail(mailUpload)) {
				ra.addFlashAttribute("msg", "msgTrue"); //성공
			}else {
				ra.addFlashAttribute("msg", "msgFalse"); //실패
			}
			
			ModelAndView mv = new ModelAndView();
			mv.setViewName("redirect:/recruit/recruitResources");
			//mv.setViewName("redirect:/recruit/application");
			
			return mv;
		}
		
	}
