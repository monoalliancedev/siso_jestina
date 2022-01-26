package com.jt.controller.en;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.BoardJtService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;


@Controller("ENNewsController")
public class NewsController {

	@Autowired
	BoardJtService boardJtService;
	

	private static final String SiteLang= "EN";
	private static final String SiteFolder= "en";
	
	//NEWS : 공지사항 ///news/gongji
	@RequestMapping(value="/"+SiteFolder+"/news/gongji" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView gongji(@ModelAttribute("search") SearchDTO search) throws Throwable{
	
		String gubun = "alim";
		search.setKeyGubun(gubun); //종류(공지사항)
		search.setKeyIsnt(SiteLang); //언어
		search.setKeyValue1("Y"); //게시여부
		
		search.setTotal_rows(boardJtService.count(search)); //search에 총 글수를 넣어준다. 
		List<FrontBoardJtDTO> list = boardJtService.FrontList(search) ;
		
		//mv addObject
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);		
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
				, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
				, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
				, 10
				, "/images/common/icon_paging_prev.svg"
				, "/images/common/icon_paging_next.svg"
				, "/images/common/icon_paging_first.svg"
				, "/images/common/icon_paging_last.svg"
				, "goPage"));
		mv.addObject("page", search) ;
		mv.setViewName("/"+SiteFolder+"/news/gongji");
	
		return mv;
		
	}
	
	//NEWS : 공지사항 상세보기
	@PostMapping(value="/"+SiteFolder+"/news/gongjiView")
	public ModelAndView gongjiView(HttpServletRequest request
								, @ModelAttribute("search") SearchDTO search) throws Throwable{
		String gubun = "alim";
		ParameterMap map = new ParameterMap( request );  // request
		//-- 게시물 정보
		String seq = ComUtils.objToStr(map.get("seq"));
		FrontBoardJtDTO boardJtDTO = boardJtService.FrontSelect(Integer.parseInt(seq),SiteLang);
		
		search.setKeyGubun(gubun); //종류(공지사항)
		search.setKeyIsnt(SiteLang); //언어
		search.setKeyValue1("Y"); //게시여부
		search.setKeySeq(Integer.parseInt(seq));
		
		//-- 이전글
		FrontBoardJtDTO bTmp1 = boardJtService.FrontPreSelect(search);
		if(bTmp1 != null) {
			boardJtDTO.setPreSeq(bTmp1.getSeq());
			boardJtDTO.setPreRegdate(bTmp1.getRegdate());
			boardJtDTO.setPreTitle(bTmp1.getTitle());
		}	
				
		//-- 다음글
		FrontBoardJtDTO bTmp2 = boardJtService.FrontNextSelect(search);
		if(bTmp2 != null) {
			boardJtDTO.setNextSeq(bTmp2.getSeq());
			boardJtDTO.setNextRegdate(bTmp2.getRegdate());
			boardJtDTO.setNextTitle(bTmp2.getTitle());
		}	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", boardJtDTO);
		mv.addObject("fileFolder", gubun);
		mv.setViewName("/"+SiteFolder+"/news/gongjiView");
		return mv;
	}
		
	//NEWS : 뉴스 ///news/news
	@RequestMapping(value="/"+SiteFolder+"/news/news" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView news(@ModelAttribute("search") SearchDTO search) throws Throwable{
		
		String gubun = "news";
		search.setKeyGubun(gubun); //종류(공지사항)
		search.setKeyIsnt(SiteLang); //언어
		search.setKeyValue1("Y"); //게시여부
			
		search.setTotal_rows(boardJtService.count(search)); //search에 총 글수를 넣어준다. 
		List<FrontBoardJtDTO> list = boardJtService.FrontList(search) ;
			
		//mv addObject
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", list);		
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()	/* 전체 low수 */ 
							, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
							, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
							, 10
							, "/images/common/icon_paging_prev.svg"
							, "/images/common/icon_paging_next.svg"
							, "/images/common/icon_paging_first.svg"
							, "/images/common/icon_paging_last.svg"
							, "goPage"));
		mv.addObject("page", search) ;
		mv.addObject("fileFolder", gubun);
		mv.setViewName("/"+SiteFolder+"/news/news");
		
		return mv;
	}
	//NEWS : news 상세보기
	@RequestMapping(value="/"+SiteFolder+"/news/newsView" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView newsView(HttpServletRequest request
								, @ModelAttribute("search") SearchDTO search) throws Throwable{
		String gubun = "news";
		ParameterMap map = new ParameterMap( request );  // request
		//-- 게시물 정보
		String seq = ComUtils.objToStr(map.get("seq"));
		FrontBoardJtDTO boardJtDTO = boardJtService.FrontSelect(Integer.parseInt(seq),SiteLang);
			
		search.setKeyGubun(gubun); //종류(뉴스)
		search.setKeyIsnt(SiteLang); //언어
		search.setKeyValue1("Y"); //게시여부
		search.setKeySeq(Integer.parseInt(seq));
			
		//-- 이전글
		FrontBoardJtDTO bTmp1 = boardJtService.FrontPreSelect(search);
		if(bTmp1 != null) {
			boardJtDTO.setPreSeq(bTmp1.getSeq());
			boardJtDTO.setPreRegdate(bTmp1.getRegdate());
			boardJtDTO.setPreTitle(bTmp1.getTitle());
		}	
					
		//-- 다음글
		FrontBoardJtDTO bTmp2 = boardJtService.FrontNextSelect(search);
		if(bTmp2 != null) {
			boardJtDTO.setNextSeq(bTmp2.getSeq());
			boardJtDTO.setNextRegdate(bTmp2.getRegdate());
			boardJtDTO.setNextTitle(bTmp2.getTitle());
		}	
			
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", boardJtDTO);
		mv.addObject("fileFolder", gubun);
		mv.setViewName("/"+SiteFolder+"/news/newsView");
		return mv;
	}
	
	
	
}
