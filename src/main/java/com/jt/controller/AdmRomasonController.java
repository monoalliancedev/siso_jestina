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
import com.jt.domain.RomasonDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.CategoryService;
import com.jt.service.RomasonService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmRomasonController {

	// 권한키값(팝업),redirect
	private static final String authorityKey = "roman";
	private static final String authorityHome = "redirect:/jtadm/";

	@Autowired
	AdmJtAuthorityService admJtAuthService;

	@Autowired
	RomasonService romasonService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	UploadFileService fileService;

	// 로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO) principal;
	}

	// ### 게시여부 변경
	@PostMapping(value = "/jtadm/brand/romason/IsntYN")
	public ModelAndView romasonIsntYN(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search
									, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		ParameterMap map = new ParameterMap(request);
		romasonService.isntChange(map);

		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/brand/romason/romasonPro");
		return mv;
	}

	// ### 리스트
	@GetMapping(value = "/jtadm/brand/romason/romasonPro")
	public ModelAndView romasonList(@ModelAttribute("search") SearchDTO search, RedirectAttributes ra)
			throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		search.setTotal_rows(romasonService.count(search));
		List<RomasonDTO> list = romasonService.list(search);

		// mv addObject
		mv.addObject("totalCount", romasonService.totalCount());
		mv.addObject("list", list);
		mv.addObject("categoryList", categoryService.categoryList());
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows() /* 전체 low수 */
							, ComUtils.objToIntDef(search.getPg_rows(), 10) /* 페이지 당 레코드 수 => 없으면 10 */
							, ComUtils.objToIntDef(search.getCpage(), 1) /* 현재 페이지 => 없으면 1 */
							, 10, "이전페이지", "다음페이지", "첫페이지", "마지막페이지", "goPage"));
		mv.addObject("page", search);
		mv.setViewName("/adm/brand/romason/romasonPro");
		return mv;
	}

	// ### 등록폼(seq=0)/수정폼(seq>0)
	@PostMapping(value = "/jtadm/brand/romason/romasonProView")
	public ModelAndView romasonForm(HttpServletRequest request
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
		RomasonDTO romason = new RomasonDTO();

		// 등록
		if (seq.equals("0")) {
			romason.setSeq(0);
			romason.setIsntYn("N");
			romason.setViewYn("N");
			search.setCpage(1);
			mv.addObject("processKey", "Insert");
		// 수정
		} else {
			romason = romasonService.select(Integer.parseInt(seq));
			mv.addObject("processKey", "Update");
		}

		mv.addObject("categoryList", categoryService.categoryList());
		mv.addObject("romason", romason);
		mv.setViewName("/adm/brand/romason/romasonProView");
		return mv;
	}

	// ### 등록 및 수정 Proc
	@PostMapping(value = "/jtadm/brand/romason/romasonProProc")
	public ModelAndView InsertUpdateProc(@ModelAttribute("search") SearchDTO search
										, HttpServletRequest request
										, RomasonDTO romason
										, RedirectAttributes ra) throws Throwable {
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		// -- Service 호출
		romasonService.insertAndUpdate(romason, request);

		// -- mv,ra
		if (romason.getSeq() > 0)
			ra.addFlashAttribute("msg", "updateOK"); // 수정 성공여부
		else
			ra.addFlashAttribute("msg", "insertOK"); // 등록 성공여부

		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/brand/romason/romasonPro");
		return mv;
	}

	// ### 삭제(리스트,수정폼)
	@PostMapping(value = "/jtadm/brand/romason/romasonProDel")
	public ModelAndView romasonDel(Integer seq, SearchDTO search, RedirectAttributes ra) throws Throwable {
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		romasonService.delete(seq);

		ra.addFlashAttribute("msg", "deleteOK"); // 성공여부
		ra.addFlashAttribute("search", search); // 검색
		mv.setViewName("redirect:/jtadm/brand/romason/romasonPro");
		return mv;
	}

	
	
	
	
	// ### 삭제(수정폼에서 파일 개별 삭제)
	@GetMapping(value = "/jtadm/brand/romason/romasonProFileDel")
	public @ResponseBody String FileDel(HttpServletRequest request) throws Throwable {

		ParameterMap map = new ParameterMap(request);

		romasonService.fileUpdate(map);

		// 성공했을때
		JSONObject jsonData = new JSONObject();
		jsonData.put("key", map.getString("key")); // 파일위치(0~4)

		return jsonData.toString();
	}
	
	//### 게시여부 Y값이 하나이상인지 체크
	@GetMapping(value="/jtadm/brand/romason/IsntYCount")
	public @ResponseBody int isntYCount() throws Throwable{
		return romasonService.isntYCount();
	}


}
