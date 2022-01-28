package com.jt.controller.cn;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.SearchDTO;
import com.jt.domain.StoreDTO;
import com.jt.service.StoreService;
import com.jt.util.ComUtils;
import com.jt.util.Constants;
import com.jt.util.FrontPaging;


@Controller("CNStoreController")
public class StoreController {

	@Autowired
	StoreService storeService;
	
	private static final String SiteLang= "CN";
	private static final String SiteFolder= "cn";
	
		
	// ### 대륙에 해당하는 국가 List 를 가져온다.
	@GetMapping(value = "/"+SiteFolder+"/store/Country")
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
		JSONObject data = new JSONObject();
		data.put("code", countryCode);
		data.put("name", countryName);
		return data.toString();
	}
	
	//-- 매장(국외)
	@GetMapping(value = "/"+SiteFolder+"/store/overseas")
	public ModelAndView overseas(@ModelAttribute("search") SearchDTO search) throws Throwable {

		search.setKeyIsnt(SiteLang);
		search.setTotal_rows(storeService.count(search, "Overseas")); // search에 총 글수를 넣어준다.
		List<StoreDTO> list = storeService.list(search, "Overseas");

		ModelAndView mv = new ModelAndView();
		mv.addObject("totalCount", search.getTotal_rows());
		mv.addObject("list", list);
		mv.addObject("paging", FrontPaging.ShowPageBar(search.getTotal_rows() // 전체 low수
				, ComUtils.objToIntDef(search.getPg_rows(), 10) // 페이지 당 레코드 수 => 없으면 10
				, ComUtils.objToIntDef(search.getCpage(), 1) // 현재 페이지 => 없으면 1
				, 10
				, "/images/common/icon_paging_prev.svg"
				, "/images/common/icon_paging_next.svg"
				, "/images/common/icon_paging_first.svg"
				, "/images/common/icon_paging_last.svg"
				, "goPage"));
		mv.addObject("page", search);
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
		mv.setViewName("/"+SiteFolder+"/store/overseas"); // 국외
		return mv;
	}
	
	//-- 매장(국내)
	@GetMapping(value="/"+SiteFolder+"/store/domestic")
	public ModelAndView list(@ModelAttribute("search") SearchDTO search) throws Throwable {

		search.setKeyIsnt(SiteLang);
		search.setTotal_rows(storeService.count(search,"Domestic")); // search에 총 글수를 넣어준다. KR:국내
		List<StoreDTO> list = storeService.list(search,"Domestic");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("totalCount", search.getTotal_rows());
		mv.addObject("list", list);
		mv.addObject("paging", FrontPaging.ShowPageBar(search.getTotal_rows() // 전체 low수
					, ComUtils.objToIntDef(search.getPg_rows(), 10) // 페이지 당 레코드 수 => 없으면 10
					, ComUtils.objToIntDef(search.getCpage(), 1) // 현재 페이지 => 없으면 1
					, 10
					, "/images/common/icon_paging_prev.svg"
					, "/images/common/icon_paging_next.svg"
					, "/images/common/icon_paging_first.svg"
					, "/images/common/icon_paging_last.svg"
					, "goPage"));
		mv.addObject("page", search);
		mv.addObject("areaList", Constants._JtCNArea); // 지역
		mv.addObject("storeList", Constants._JtStoreCNGubun); // 매장구분(CN)
		mv.setViewName("/"+SiteFolder+"/store/domestic"); // 국내
		return mv;
	}
	
	
}
