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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jt.domain.AdmDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.StoreDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.StoreService;
import com.jt.util.ComUtils;
import com.jt.util.Constants;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmStoreController {

	// 권한키값(팝업),redirect
	private static final String authorityKey = "store";
	private static final String authorityHome = "redirect:/jtadm/";

	@Autowired
	AdmJtAuthorityService admJtAuthService;

	@Autowired
	StoreService storeService;

	// 로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO) principal;
	}

	// ### 대륙에 해당하는 국가 List 를 가져온다.
	// ### List, View화면에서 select.OnChange()에서 호출한 주소
	@GetMapping(value = "/jtadm/brand/store/Country")
	public @ResponseBody String Country(HttpServletRequest request) throws Throwable {

		String code = request.getParameter("code"); // 대륙코드
		String countryCode = "";
		String countryName = "";

		for (int i = 0; i < Constants._JtCountryCode.length; i++) {

			String[][] inArr = Constants._JtCountryCode[i];

			for (int j = 0; j < inArr.length; j++) {
				String[] in2Arr = inArr[j];

				if (in2Arr[0].equals(code)) {
					countryCode = countryCode + "," + in2Arr[1];
					countryName = countryName + "," + in2Arr[2];
				}
			}
		}
		// 성공했을때
		JSONObject data = new JSONObject();
		data.put("code", countryCode);
		data.put("name", countryName);
		return data.toString();

	}

	// ### 리스트
	@GetMapping(value = "/jtadm/brand/store/list{gubun}")
	public ModelAndView list(@ModelAttribute("search") SearchDTO search
							, @PathVariable String gubun
							, RedirectAttributes ra) throws Throwable {
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		search.setTotal_rows(storeService.count(search, gubun)); // search에 총 글수를 넣어준다.
		
		List<StoreDTO> list = storeService.list(search, gubun);

		mv.addObject("totalCount", storeService.totalCount(gubun));
		mv.addObject("list", list);
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows() // 전체 low수
							, ComUtils.objToIntDef(search.getPg_rows(), 10) // 페이지 당 레코드 수 => 없으면 10
							, ComUtils.objToIntDef(search.getCpage(), 1) // 현재 페이지 => 없으면 1
							, 10, "이전페이지", "다음페이지", "첫페이지", "마지막페이지", "goPage"));
		mv.addObject("page", search);

		// 국내검색
		if (gubun.equals("Domestic")) {
			mv.addObject("areaList", Constants._JtArea); // 지역
			mv.addObject("brandList", Constants._JtBrand); // 브랜드
			mv.addObject("storeList", Constants._JtStoreGubun); // 매장구분
		// 해외검색
		} else {
			/*
			mv.addObject("continentList", Constants._JtContinent); // 지역

			// 검색어 대륙 정보에 따른 국가 리스트를 불러온다.
			if (!ComUtils.nullToStr(search.getKeyValue1()).equals("")) {

				ArrayList<String> tempCountryCodeList = new ArrayList<String>();
				ArrayList<String> tempCountryNameList = new ArrayList<String>();

				for (int i = 0; i < Constants._JtCountryCode.length; i++) {
					String[][] inArr = Constants._JtCountryCode[i];
					for (int j = 0; j < inArr.length; j++) {
						String[] in2Arr = inArr[j];
						if (in2Arr[0].equals(search.getKeyValue1())) {
							tempCountryCodeList.add(in2Arr[1]);
							tempCountryNameList.add(in2Arr[2]);
						}
					}
				}
				mv.addObject("countryCodeList", tempCountryCodeList); // 국가
				mv.addObject("countryNameList", tempCountryNameList); // 국가
			}
			*/
		}
		
		//System.out.println("########" + gubun);
		mv.setViewName("/adm/brand/store/storeList" + gubun); // 국내
	
		return mv;
	}

	// ### 등록폼(seq=0)/수정폼(seq>0)
	@PostMapping(value = "/jtadm/brand/store/view{gubun}")
	public ModelAndView InsertUpdateForm(HttpServletRequest request
										, @PathVariable String gubun
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
		StoreDTO store = new StoreDTO();

		// 등록
		if (seq.equals("0")) {
			store.setSeq(0);
			mv.addObject("processKey", "Insert");
			// 수정
		} else {
			store = storeService.select(Integer.parseInt(seq));
			mv.addObject("processKey", "Update");
		}
		mv.addObject("store", store);

		// 국내검색(Domestic)
		if (gubun.equals("Domestic")) {
			mv.addObject("areaList", Constants._JtArea); // 지역
			mv.addObject("brandList", Constants._JtBrand); // 브랜드
			mv.addObject("storeList", Constants._JtStoreGubun); // 매장구분
			// 해외검색
		} else {
			mv.addObject("continentList", Constants._JtContinent); // 대륙

			// System.out.println("1. #######################"+search.getKeyValue1());
			// 검색어가 있으면 //search.getKeyValue1() 로 나라를 뿌려줌
			if (!ComUtils.nullToStr(store.getValue1()).equals("")) {

				// System.out.println("2.#######################"+search.getKeyValue1());
				ArrayList<String> tempCountryCodeList = new ArrayList<String>();
				ArrayList<String> tempCountryNameList = new ArrayList<String>();

				for (int i = 0; i < Constants._JtCountryCode.length; i++) {
					String[][] inArr = Constants._JtCountryCode[i];
					for (int j = 0; j < inArr.length; j++) {
						String[] in2Arr = inArr[j];
						if (in2Arr[0].equals(store.getValue1())) {
							tempCountryCodeList.add(in2Arr[1]);
							tempCountryNameList.add(in2Arr[2]);
						}
					}
				}
				mv.addObject("countryCodeList", tempCountryCodeList); // 국가코드 리스트
				mv.addObject("countryNameList", tempCountryNameList); // 국가코드 리스트
			}
		}

		mv.setViewName("/adm/brand/store/storeView" + gubun);
		return mv;
	}

	// ### 등록 과 수정 process
	@PostMapping(value = "/jtadm/brand/store/proc{gubun}")
	public ModelAndView InsertUpdateProc(StoreDTO store
										, SearchDTO search
										, @PathVariable String gubun
										, HttpServletRequest request
										, RedirectAttributes ra) throws Throwable {
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		// -- Service
		storeService.insertAndUpdate(store, request);

		// -- ra,mv
		if (store.getSeq() > 0)
			ra.addFlashAttribute("msg", "updateOK"); // 수정 성공여부
		else
			ra.addFlashAttribute("msg", "insertOK"); // 등록 성공여부

		ra.addFlashAttribute("search", search); // 등록 성공여부
		mv.setViewName("redirect:/jtadm/brand/store/list" + gubun);
		return mv;
	}

	// ### 삭제(리스트삭제)
	@PostMapping(value = "/jtadm/brand/store/del{gubun}")
	public ModelAndView Del(Integer seq, SearchDTO search, @PathVariable String gubun, RedirectAttributes ra)
			throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		storeService.delete(seq);
		ra.addFlashAttribute("msg", "deleteOK"); // 성공여부
		ra.addFlashAttribute("search", search); // 검색
		mv.setViewName("redirect:/jtadm/brand/store/list{gubun}");
		return mv;
	}

	// ### 삭제(수정폼에서 삭제)
	@GetMapping(value = "/jtadm/brand/store/del2{gubun}")
	public ModelAndView DelForm(Integer seq, @PathVariable String gubun, RedirectAttributes ra) throws Throwable {

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}

		storeService.delete(seq);
		ra.addFlashAttribute("msg", "deleteOK"); // 성공여부

		mv.setViewName("redirect:/jtadm/brand/store/list{gubun}");
		return mv;
	}
	
	
	//### Sort 변경
	@PostMapping(value="/jtadm/brand/store/sortProc{gubun}")
	public ModelAndView sortProc(HttpServletRequest request
							, @PathVariable String gubun
							, @ModelAttribute("search") SearchDTO search
							, RedirectAttributes ra ) throws Throwable{
							
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		
		
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
						
		ParameterMap map = new ParameterMap(request);
		map.put("keyIsnt", search.getKeyIsnt());
		map.put("keyword", search.getKeyword());
		map.put("keyValue1", search.getKeyValue1());
		map.put("keyValue2", search.getKeyValue2());
		map.put("keyValue3", search.getKeyValue3());
		map.put("gubun", gubun);
		
		
		storeService.sortChange(map);

		ra.addFlashAttribute("search", search);
		mv.setViewName("redirect:/jtadm/brand/store/list{gubun}");
		
		return mv;
	}

}