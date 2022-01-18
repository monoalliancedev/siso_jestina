package com.jt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jt.domain.AdmDTO;
import com.jt.domain.BoardJtDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.BoardJtService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmBoardJtController {
	
	// 권한키값(팝업),redirect
	private static final String authorityHome = "redirect:/jtadm/";

		
	@Autowired
	AdmJtAuthorityService admJtAuthService;
	
	@Autowired
	BoardJtService boardJtService;
	
	@Autowired
	UploadFileService fileService;
	
	
	//로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal; 
	}

	
	//### 게시여부 변경
	@PostMapping(value="/jtadm/board/{gubun}/IsntYN")
	public ModelAndView boardIsntYN(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search
									, @PathVariable String gubun
			 						, RedirectAttributes ra ) throws Throwable{
			
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(gubun) == 0) { // 권한 없음(gubun=>notice,alim,news)
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
		
		ParameterMap map = new ParameterMap( request );
		map.put("gubun" , gubun);
		
		boardJtService.isntChange(map) ;
			
		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/board/"+gubun+"/list");
		
		return mv;
	}
	
	//### 게시여부 Y값이 하나이상인지 체크
	@GetMapping(value="/jtadm/board/{gubun}/IsntYCount")
	public @ResponseBody int isntYCount(@PathVariable String gubun) throws Throwable{
		return boardJtService.isntYCount(gubun);
	}
	
	//### 리스트
	@GetMapping(value="/jtadm/board/{gubun}/list")
	public ModelAndView boardList(@ModelAttribute("search") SearchDTO search
								, @PathVariable String gubun
								, RedirectAttributes ra) throws Throwable{
			
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(gubun) == 0) { // 권한 없음(gubun=>notice,alim,news)
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
			
		search.setKeyGubun(gubun);
		search.setTotal_rows(boardJtService.count(search)); //search에 총 글수를 넣어준다. 
		List<BoardJtDTO> list = boardJtService.list(search) ;
			
		//mv addObject
		mv.addObject("totalCount", boardJtService.totalCount(gubun)); 
		mv.addObject("list", list);		
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
									, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
									, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
									, 10, "이전페이지","다음페이지","첫페이지","마지막페이지","goPage"));
		mv.addObject("page", search) ;
		mv.setViewName("/adm/board/"+gubun+"/list");
		return mv;
	}
		
	//### 채용공고 등록폼(seq=0)/수정폼(seq>0)
	@PostMapping(value="/jtadm/board/{gubun}/view")
	public ModelAndView boardForm(HttpServletRequest request
								, @PathVariable String gubun
								, @ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra ) throws Throwable{

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(gubun) == 0) { // 권한 없음(gubun=>notice,alim,news)
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
		
		ParameterMap map = new ParameterMap( request );  // request
		String seq = ComUtils.objToStr(map.get("seq"));
		BoardJtDTO boardJtDTO = new BoardJtDTO();
		
		//등록
		if(seq.equals("0")) {
			boardJtDTO.setSeq(0);
			boardJtDTO.setIsntYn("N");
			boardJtDTO.setMainYn("N");
			mv.addObject("processKey", "Insert");
		//수정	
		}else{
			boardJtDTO = boardJtService.select(Integer.parseInt(seq));
			mv.addObject("processKey", "Update");
		}
		
		mv.addObject("board", boardJtDTO);
		mv.setViewName("/adm/board/"+gubun+"/view");
		return mv;
	}
	
	//### 등록 Proc
	@PostMapping(value="/jtadm/board/{gubun}/ProcInsert")
	public ModelAndView boardProcInsert(HttpServletRequest request
										, BoardJtDTO boardJtDTO
										, @ModelAttribute("search") SearchDTO search
										, @PathVariable String gubun
										, RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(gubun) == 0) { // 권한 없음(gubun=>notice,alim,news)
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		boardJtDTO.setGubun(gubun);
		//-- Service 호출
		boardJtService.insert(boardJtDTO, request);
		//-- mv,ra
		ra.addFlashAttribute("msg", "insertOK"); //성공여부
		ra.addFlashAttribute("search", search); 
		mv.setViewName("redirect:/jtadm/board/"+gubun+"/list");
		return mv;
	}
		
	//### 수정 Proc
	@PostMapping(value="/jtadm/board/{gubun}/ProcUpdate")
	public ModelAndView boardProc(HttpServletRequest request
									, BoardJtDTO boardJtDTO , SearchDTO search
									, @PathVariable String gubun
									, RedirectAttributes ra ) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(gubun) == 0) { // 권한 없음(gubun=>notice,alim,news)
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		boardJtDTO.setGubun(gubun);
		//-- Service 호출
		boardJtService.update(boardJtDTO, request);
		//-- mv,ra
		ra.addFlashAttribute("msg", "updateOK"); //성공여부
		ra.addFlashAttribute("search", search); //검색
		mv.setViewName("redirect:/jtadm/board/"+gubun+"/list");
		return mv;
	}	
	
	//### 삭제(리스트,수정폼 삭제)
	@PostMapping(value="/jtadm/board/{gubun}/Del")
	public ModelAndView boardDel(Integer seq, SearchDTO search
								, @PathVariable String gubun
								, RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(gubun) == 0) { // 권한 없음(gubun=>notice,alim,news)
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		boardJtService.delete(seq) ;
		ra.addFlashAttribute("msg", "deleteOK"); //성공여부
		ra.addFlashAttribute("search", search); //검색
		mv.setViewName("redirect:/jtadm/board/"+gubun+"/list");
		return mv;
	}
	
	//### 삭제(수정폼에서 파일 개별 삭제)
	@GetMapping(value="/jtadm/board/fileDel")
	public @ResponseBody String FileDel(HttpServletRequest request) throws Throwable{
		
		ParameterMap map = new ParameterMap( request );
		
		boardJtService.fileDelete(map);
		
		//성공했을때
		JSONObject jsonData = new JSONObject();
		jsonData.put("key", map.getString("key")); //정상
		return jsonData.toString();		
	}
	
	
		
}