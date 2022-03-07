package com.jt.controller.kr;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.ApiDataGoKrDTO;
import com.jt.domain.ApiOpendartDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.BoardJtService;
import com.jt.util.ApiDataGoKr;
import com.jt.util.ApiOpendart;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;


@Controller("IRController")
public class IRController {

	@Autowired
	BoardJtService boardJtService;
	
	private static final String SiteLang= "KR";
	private static final String SiteFolder= "kr";
		
	//IR : 주가정보
	@GetMapping(value="/ir/infor1")
	public ModelAndView infor1() throws IOException {
		
		ModelAndView mv = new ModelAndView();
		
		try {
		
			Date now = new Date();
			
			
			//오늘이 일,월요일 일경우 금요일날짜를 구한다.//나머지는 하루전
			Calendar oCalendar = Calendar.getInstance( );  
			if(oCalendar.get(Calendar.DAY_OF_WEEK)==1) now = ComUtils.AddDay(now, -2); //일요일 /이틀전
			else if(oCalendar.get(Calendar.DAY_OF_WEEK)==2) now = ComUtils.AddDay(now, -3); //월요일 /삼일전
			else now = ComUtils.AddDay(now, -1); //화요일~토요일 /하루전
			
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd"); //원하는 데이터 포맷 지정 
			String strNowDate = simpleDateFormat.format(now);
			 
			//System.out.println("구하는 날짜 : " + strNowDate);
			//System.out.println("구하는 이전 날짜 : " + strPreNowDate);
			
			ApiDataGoKr api = new ApiDataGoKr();
			ApiDataGoKrDTO apiList = (ApiDataGoKrDTO)api.ApiProc(strNowDate);
			  
			boolean loopCheck = true;
			//주가정보가 있을경우
			if(!ComUtils.isEmpty(apiList.getBasDt())) { //null값이 아니면 
				loopCheck = false;
				System.out.println("성공" + apiList.getBasDt());
			}
			
			
			
			//주가정보가 없을경우 loop
			while(loopCheck) {
				//임시날짜
				now = ComUtils.AddDay(now, -1); //데이타가 없을경우 쓸 하루전 데이타
				strNowDate = simpleDateFormat.format(now);
				
				//데이타가 없을경우 하루전 데이타를 받아온다.
				apiList = (ApiDataGoKrDTO)api.ApiProc(strNowDate);

				//System.out.println("2. 이전 구하는 날짜 : " + apiList.getBasDt());
				if(!ComUtils.isEmpty(apiList.getBasDt())) {
					loopCheck = false;
					break;
				}
			}
			
				
			mv.addObject("now", now);
			mv.addObject("info", apiList);
			
			if(ComUtils.isEmpty(apiList.getBasDt())) { //값이 없음 
				mv.setViewName("/"+SiteFolder+"/ir/infor3");	
			} else {
				mv.setViewName("/"+SiteFolder+"/ir/infor1");					
			}
			
		
		} catch(Exception e) {
			System.out.println("에러");
			mv.setViewName("/"+SiteFolder+"/ir/infor3");
			//e.printStackTrace();
		}
			
		return mv;
	}

	
		
			
	//IR : 공시정보
	@GetMapping(value="/ir/infor2")
	public ModelAndView infor2() throws UnsupportedEncodingException, IOException{
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd"); //원하는 데이터 포맷 지정 

		Date now = new Date(); //오늘날짜
		String end_de = simpleDateFormat.format(now); 
		
		now = ComUtils.AddYear(now, -1); //1년전
		String bgn_de = simpleDateFormat.format(now);  
		
		int page_no = 1;
        int page_rows = 50;
        
        ApiOpendart api = new ApiOpendart();
        List<ApiOpendartDTO> apiList = api.ApiProc(bgn_de,end_de,page_no,page_rows);
        
        ModelAndView mv = new ModelAndView();
		mv.addObject("apiList", apiList);
		mv.setViewName("/"+SiteFolder+"/ir/infor2");
		
		return mv;
	}

	//IR : 공고 //notice
	@RequestMapping(value="/ir/notice" , method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView notice(@ModelAttribute("search") SearchDTO search) throws Throwable{
			
		String gubun = "notice";
		search.setKeyGubun(gubun); //종류(공고)
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
		mv.addObject("fileFolder", gubun);
		mv.setViewName("/"+SiteFolder+"/ir/notice");
			
		return mv;
	}
	
	//IR : 공고 상세보기
	@PostMapping(value="/ir/noticeView")
	public ModelAndView noticeView(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search) throws Throwable{
		String gubun = "notice";
		ParameterMap map = new ParameterMap( request );  // request
		//-- 게시물 정보
		String seq = ComUtils.objToStr(map.get("seq"));
		FrontBoardJtDTO boardJtDTO = boardJtService.FrontSelect(Integer.parseInt(seq),SiteLang);
				
		search.setKeyGubun(gubun); //종류(공고)
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
		mv.setViewName("/"+SiteFolder+"/ir/noticeView");
		return mv;
	}

}
