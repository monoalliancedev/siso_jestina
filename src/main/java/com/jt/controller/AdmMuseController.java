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
import com.jt.domain.MuseDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.MuseService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmMuseController {

	// 권한키값(팝업),redirect
	private static final String authorityKey = "muse";
	private static final String authorityHome = "redirect:/jtadm/";

	@Autowired
	AdmJtAuthorityService admJtAuthService;

	@Autowired
	MuseService museService;

	@Autowired
	UploadFileService fileService;

	// 로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO) principal;
	}

	// ### 게시여부 변경
	@PostMapping(value = "/jtadm/brand/muse/IsntYN")
	public ModelAndView boardIsntYN(HttpServletRequest request, @ModelAttribute("search") SearchDTO search,
			RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		ParameterMap map = new ParameterMap(request);
		museService.isntChange(map);

		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/brand/muse/list");
		return mv;
	}

	// ### 리스트
	@GetMapping(value = "/jtadm/brand/muse/list")
	public ModelAndView museList(@ModelAttribute("search") SearchDTO search, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		// search에 총 글수를 넣어준다.
		search.setTotal_rows(museService.count(search));

		// 목록 받아오기(getPg_start()=0, getPg_end()=10, getKey(), getKeyword())
		List<MuseDTO> list = museService.list(search);

		// mv addObject
		mv.addObject("totalCount", museService.totalCount());
		mv.addObject("list", list);
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows() /* 전체 low수 */
							, ComUtils.objToIntDef(search.getPg_rows(), 10) /* 페이지 당 레코드 수 => 없으면 10 */
							, ComUtils.objToIntDef(search.getCpage(), 1) /* 현재 페이지 => 없으면 1 */
							, 10, "이전페이지", "다음페이지", "첫페이지", "마지막페이지", "goPage"));
		mv.addObject("page", search);
		mv.setViewName("/adm/brand/muse/list");
		return mv;
	}

	// ### 등록폼(seq=0)/수정폼(seq>0)
	@PostMapping(value = "/jtadm/brand/muse/view")
	public ModelAndView InsertUpdateForm(HttpServletRequest request
										, @ModelAttribute("search") SearchDTO search
										, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		ParameterMap map = new ParameterMap(request); // request
		String seq = ComUtils.objToStr(map.get("seq"));
		MuseDTO museDTO = new MuseDTO();

		// 등록
		if (seq.equals("0")) {
			museDTO.setSeq(0);
			museDTO.setIsntYn("N");
			museDTO.setTextLocation("Left");
			mv.addObject("processKey", "Insert");

			// 임의에 상품키값을 가져온다.(상품 등록일때)
			AdmDTO auth = getAuthAdm();
			String pseq = auth.getAdm_id() + "_" + ComUtils.getCurDate("timestamp");
			mv.addObject("pseq", pseq);
		// 수정
		} else {
			museDTO = museService.select(Integer.parseInt(seq));
			mv.addObject("pseq", seq);
			mv.addObject("processKey", "Update");
		}
		
		int curYear = Integer.parseInt(ComUtils.getCurDate("y"))+2;
		mv.addObject("curYear", curYear); // 올해+2년
		mv.addObject("loopCnt", curYear-2010);
		mv.addObject("muse", museDTO);
		mv.addObject("gubun", "muse");

		mv.setViewName("/adm/brand/muse/view");
		return mv;
	}

	// ### 등록Proc(seq=0)/수정Proc(seq>0)
	@PostMapping(value = "/jtadm/brand/muse/proc")
	public ModelAndView InsertUpdateProc(HttpServletRequest request, MuseDTO muse, SearchDTO search,
			RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		String msg = "";
		if (muse.getSeq() > 0)
			msg = "updateOK"; // 수정성공
		else
			msg = "insertOK"; // 등록성공

		// -- Service 호출
		museService.insertAndUpdate(muse, request);

		// -- mv,ra
		ra.addFlashAttribute("msg", msg); // 성공여부
		ra.addFlashAttribute("search", search); // 검색
		mv.setViewName("redirect:/jtadm/brand/muse/list");

		return mv;
	}

	// ### 삭제(리스트,수정폼)
	@PostMapping(value = "/jtadm/brand/muse/del")
	public ModelAndView Del(Integer seq, SearchDTO search, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		museService.delete(seq);
		ra.addFlashAttribute("msg", "deleteOK"); // 성공여부
		ra.addFlashAttribute("search", search); // 검색

		mv.setViewName("redirect:/jtadm/brand/muse/list");
		return mv;
	}
	
	//### 게시여부 Y값이 하나이상인지 체크
	@GetMapping(value="/jtadm/brand/muse/IsntYCount")
	public @ResponseBody int isntYCount() throws Throwable{
		return museService.isntYCount();
	}


}
