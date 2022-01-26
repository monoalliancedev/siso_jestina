package com.jt.controller;

import java.util.ArrayList;
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
import com.jt.domain.BannerDTO;
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.BannerService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Constants;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmBannerController {

	// 권한키값(메인배너관리,메인브랜드배너관리),redirect
	private static final String authorityKey1 = "Mbanner";
	private static final String authorityKey2 = "MBbanner";
	private static final String authorityHome = "redirect:/jtadm/";

	@Autowired
	AdmJtAuthorityService admJtAuthService;

	@Autowired
	BannerService bannerService;

	@Autowired
	UploadFileService fileService;

	//== 로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO) principal;
	}

	//== 리스트
	@GetMapping(value = "/jtadm/basic/Mbanner/list")
	public ModelAndView bannerList(@ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		String gubun = "MainBanner";
		search.setKeyGubun(gubun);
		search.setTotal_rows(bannerService.count(search)); // search에 총 글수를 넣어준다.
		
		List<BannerDTO> list = bannerService.list(search);

		mv.addObject("totalCount", bannerService.totalCount(gubun)); 
		mv.addObject("list", list);
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows() /* 전체 low수 */
				, ComUtils.objToIntDef(search.getPg_rows(), 10) 		/* 페이지 당 레코드 수 => 없으면 10 */
				, ComUtils.objToIntDef(search.getCpage(), 1) 			/* 현재 페이지 => 없으면 1 */
				, 10, "이전페이지", "다음페이지", "첫페이지", "마지막페이지", "goPage"));
		mv.addObject("page", search);
		mv.setViewName("/adm/basic/Mbanner/list");
		return mv;
	}

	//== 게시여부 변경
	@PostMapping(value = "/jtadm/basic/Mbanner/IsntYN")
	public ModelAndView MbannerIsntYN(HttpServletRequest request
									, @ModelAttribute("search") SearchDTO search
									, RedirectAttributes ra) throws Throwable {
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		ParameterMap map = new ParameterMap(request);
		bannerService.isntChange(map);

		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/basic/Mbanner/list");

		return mv;
	}

	//== 등록폼(seq=0) / 수정폼(seq>0)
	@PostMapping(value = "/jtadm/basic/Mbanner/view")
	public ModelAndView boardForm(HttpServletRequest request
								, @ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra)
			throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		BannerDTO bannerDTO = new BannerDTO();
		ParameterMap map = new ParameterMap(request); // request
		String seq = ComUtils.objToStr(map.get("seq"));
		
		// 등록
		if (seq.equals("0")) {
			bannerDTO.setSeq(0);
			bannerDTO.setIsntYn("N");
			mv.addObject("processKey", "Insert");
		// 수정
		} else {
			bannerDTO = bannerService.select(Integer.parseInt(seq));
			mv.addObject("processKey", "Update");
		}

		mv.addObject("banner", bannerDTO);
		mv.setViewName("/adm/basic/Mbanner/view");
		return mv;
	}

	//== 등록 Proc
	@PostMapping(value = "/jtadm/basic/Mbanner/ProcInsert")
	public ModelAndView bannerProcInsert(HttpServletRequest request
										, @ModelAttribute("search") SearchDTO search
										, BannerDTO bannerDTO
										, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		String gubun = "MainBanner";
		bannerDTO.setGubun(gubun);
		bannerService.insert(bannerDTO, request);
		
		ra.addFlashAttribute("msg", "insertOK"); // 성공여부
		ra.addFlashAttribute("search", search); // 검색
		mv.setViewName("redirect:/jtadm/basic/Mbanner/list");
		return mv;
	}

	//== 수정 Proc
	@PostMapping(value = "/jtadm/basic/Mbanner/ProcUpdate")
	public ModelAndView bannerProc(HttpServletRequest request
								, BannerDTO bannerDTO
								, @ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		String gubun = "MainBanner";
		bannerDTO.setGubun(gubun);
		bannerService.update(bannerDTO, request);

		ra.addFlashAttribute("msg", "updateOK"); // 성공여부
		ra.addFlashAttribute("search", search); // 검색
		mv.setViewName("redirect:/jtadm/basic/Mbanner/list");
		return mv;
	}

	// ### 삭제
	@PostMapping(value = "/jtadm/basic/Mbanner/Del")
	public ModelAndView boardDel(Integer seq
								, SearchDTO search
								, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		bannerService.delete(seq);
		ra.addFlashAttribute("msg", "deleteOK"); // 성공여부
		ra.addFlashAttribute("search", search); // 검색

		mv.setViewName("redirect:/jtadm/basic/Mbanner/list");
		return mv;
	}


	// ### 삭제(수정폼에서 파일 개별 삭제)
	@GetMapping(value = "/jtadm/basic/fileDel")
	public @ResponseBody String FileDel(HttpServletRequest request) throws Throwable {

		ParameterMap map = new ParameterMap(request);

		bannerService.fileDelete(map);

		// 성공했을때
		JSONObject jsonData = new JSONObject();
		jsonData.put("key", map.getString("key")); // 파일위치(0~4)
		jsonData.put("gubun", map.getString("gubun")); // 메뉴(구분)

		return jsonData.toString();
	}
	
	
	//== 게시여부 Y값이 하나이상인지 체크
	@GetMapping(value="/jtadm/basic/Mbanner/IsntYCount")
	public @ResponseBody int isntYCount(String gubun) throws Throwable{
		return bannerService.isntYCount(gubun);
	}
	
	//== Sort 변경
	@PostMapping(value="/jtadm/basic/Mbanner/sortProc")
	public ModelAndView sortProc(HttpServletRequest request
								, @ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra ) throws Throwable{
							
		//** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey1) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
						
		ParameterMap map = new ParameterMap(request);//
		map.put("key", search.getKey());
		map.put("keyword", search.getKeyword());
		map.put("keyIsnt", search.getKeyIsnt());
		
		bannerService.sortChange(map);

		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/basic/Mbanner/list");
		return mv;
	}
	
	

//############## 메인브랜드배너 관리 #####################################		

	// ### 메인브랜드배너 수정폼
	@GetMapping(value = "/jtadm/basic/MBbanner/mainBrandBanner")
	public ModelAndView MBbannerView(RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}


		List<BannerDTO> banner = new ArrayList<BannerDTO>();

		for (int i = 0; i < Constants.arrGubun.length; i++) {
			BannerDTO bannerDto1 = new BannerDTO(); // 비어있는 bannerDTO
			BannerDTO bannerDto2 = bannerService.selectGubun(Constants.arrGubun[i]); // DB에서 받아온 bannerDTO
			if (!ComUtils.isEmpty(bannerDto2)) {
				bannerDto1 = bannerDto2; // DB내용이 있으면
			}
			banner.add(bannerDto1);
			System.out.println("############ " + banner.toString());
		}

		mv.addObject("arrGubun", Constants.arrGubun);
		mv.addObject("arrTitle", Constants.arrTitle);
		mv.addObject("banner", banner);
		mv.setViewName("/adm/basic/MBbanner/mainBrandBanner");
		return mv;
	}

	// ### 메인 브랜드 배너 저장(수정 및 등록)
	@PostMapping(value = "/jtadm/basic/MBbanner/mainBrandBannerProc")
	public ModelAndView bannerProcDeleteInsert(HttpServletRequest request
											, BannerDTO bannerDTO
											, RedirectAttributes ra)
			throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey2) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		// System.out.println("controller ###################################### :
		// "+bannerDTO.getSeq());

		// -- Service 호출
		bannerService.MBBannerProc(bannerDTO);
		// -- mv,ra
		ra.addFlashAttribute("msg", "insertOK"); // 성공여부
		mv.setViewName("redirect:/jtadm/basic/MBbanner/mainBrandBanner");
		return mv;
	}

}
