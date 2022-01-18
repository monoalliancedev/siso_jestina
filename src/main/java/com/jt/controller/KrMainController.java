package com.jt.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.CategoryDTO;
import com.jt.domain.FaqDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.FrontMuseDTO;
import com.jt.domain.RecruitmentDTO;
import com.jt.domain.RomasonDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.StoreDTO;
import com.jt.domain.UploadFileDTO;
import com.jt.service.BannerService;
import com.jt.service.BoardJtService;
import com.jt.service.BrandBannerService;
import com.jt.service.CategoryService;
import com.jt.service.FaqService;
import com.jt.service.MuseService;
import com.jt.service.RecruitmentService;
import com.jt.service.RomasonService;
import com.jt.service.StoreService;
import com.jt.service.UploadFileService;
import com.jt.util.ComUtils;
import com.jt.util.Constants;
import com.jt.util.FrontPaging;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;


@Controller

public class KrMainController {

	@Autowired
	BrandBannerService brandBannerService;
	
	@Autowired
	StoreService storeService;
	
	@Autowired
	MuseService museService;
	
	@Autowired
	RomasonService romasonService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	UploadFileService ufService;
	
	@Autowired
	BoardJtService boardJtService;
	
	@Autowired
	BannerService bannerService;
	
	@Autowired
	RecruitmentService recruitService;
	
	@Autowired
	FaqService faqService;
	
	private static final String SiteLang= "KR";
		
	//-- 메인
	@GetMapping(value="/")
	public ModelAndView krIndex() throws Throwable{
		
		ParameterMap map = new ParameterMap();
		map.put("lang", SiteLang);
		
		//NEWS 
		FrontBoardJtDTO mainNews = boardJtService.MainNews(SiteLang);
		
		//메인배너
		FrontBannerDTO mainBanner = bannerService.MainBanner(SiteLang);

		//메인브랜드 배너
		map.put("gubun", "Jewerly");
		FrontBannerDTO mainBarndJ = bannerService.MainBarndBanner(map);
		map.put("gubun", "Bag");
		FrontBannerDTO mainBarndB = bannerService.MainBarndBanner(map);
		map.put("gubun", "Romason");
		FrontBannerDTO mainBarndR = bannerService.MainBarndBanner(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("mainNews", mainNews);
		mv.addObject("mainBanner", mainBanner);
		mv.addObject("mainBarndJ", mainBarndJ);
		mv.addObject("mainBarndB", mainBarndB);
		mv.addObject("mainBarndR", mainBarndR);

		mv.setViewName("/kr/index");
		return mv;
	}
	
	//-- 브랜드 쥬얼리
	@GetMapping(value="/brand/jewelry")
	public ModelAndView jewerly() throws Throwable{
		
		String gubun = "Jewerly";
		ParameterMap map = new ParameterMap();
		map.put("lang", SiteLang); //언어
		map.put("gubun", gubun);//카테고리

		ModelAndView mv = new ModelAndView();
		mv.addObject("brandBanner", brandBannerService.FrontSelect(map));
		mv.addObject("fileFolder", gubun);
		mv.setViewName("kr/brand/jewelry");
		return mv;
	}
	
	//-- 브랜드 핸드백
	@GetMapping(value="/brand/handbag")
	public ModelAndView handbag() throws Throwable{
		
		String gubun = "Bag";
		ParameterMap map = new ParameterMap();
		map.put("lang", SiteLang); //언어
		map.put("gubun", gubun);//카테고리

		ModelAndView mv = new ModelAndView();
		mv.addObject("brandBanner", brandBannerService.FrontSelect(map));
		mv.addObject("fileFolder", gubun);
		mv.setViewName("kr/brand/handbag");
		return mv;
	}
	
	//-- 브랜드 로만손 제품 리스트
	@GetMapping(value="/brand/romanson")
	public ModelAndView romasonList(String cateCode) throws Throwable {
		
		//카테고리정보(이전,다음)
		List<CategoryDTO> cateInfo = new ArrayList<>();
		//상품리스트
		List<RomasonDTO> proList = new ArrayList<>(); 
		//카테고리리스트,첫카테고리선택
		List<CategoryDTO> cateList = categoryService.categoryList();
		
		 
		if(ComUtils.objToStr(cateCode).equals("")) {
			//NEW ARRIVALS(추천 신상품)
			proList = romasonService.FrontNewList();
			cateInfo.add(cateList.get(0)); //다음카테고리
		}else{
			int cateSeq = Integer.parseInt(cateCode); 	
			proList = romasonService.FrontList(cateSeq);
			cateInfo = categoryService.FrontSelect(cateSeq);
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("fileFolder", "Product"); //상품폴더
		mv.addObject("cateCode", cateCode); //카테고리키값
		mv.addObject("cateInfo", cateInfo); //카테고리이전,다음정보
		mv.addObject("categoryList", cateList); //카테고리 리스트
		mv.addObject("list", proList); //상품리스트
		mv.setViewName("/kr/brand/romansonList");
		return mv;
	}
	
	//-- 브랜드 로만손 제품 상세정보
	@GetMapping(value="/brand/romansonView")
	public ModelAndView romansonView(String code,String cateCode) throws Throwable {
		
		ParameterMap map = new ParameterMap();
		map.put("cateCode", cateCode); //카테고리 Code
		map.put("code", code); //상품 code
		
		RomasonDTO romason = romasonService.FrontSelect(map);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cateCode", cateCode); //카테고리
		mv.addObject("fileFolder", "Product"); //상품폴더
		mv.addObject("romason", romason); //제품정보
		mv.setViewName("/kr/brand/romansonView");
		return mv;
	}
	
	
	//테스트
	
	//-- 브랜드 뮤즈
	@GetMapping(value="/brand/archive")
	public ModelAndView archive() throws Throwable {
		
		ParameterMap map = new ParameterMap();  // request
		HashMap<String,List<FrontMuseDTO>> museAndYearList = new HashMap<String,List<FrontMuseDTO>>();
		HashMap<Integer,List<UploadFileDTO>> museAndFileList = new HashMap<Integer,List<UploadFileDTO>>();
		
		//뮤즈 정보가 있는 년도를 불러온다.
		for(String year : museService.FrontYearlist(SiteLang)){

			List<FrontMuseDTO> museList = museService.Frontlist(SiteLang,year);
			museAndYearList.put(year,museList); //년도별 뮤즈리스트를 넣는다.
		
			for(FrontMuseDTO muse : museList){
				//한 뮤즈에 이미지 정보를 불러온다.
				String pseq = muse.getSeq() + "-" + SiteLang;
				map.put("pseq", pseq);
				map.put("gubun", "muse");
				List<UploadFileDTO> fileList = ufService.list(map);
				
				museAndFileList.put(muse.getSeq(),fileList); //뮤즈코드별 이미지 리스트를 넣는다.
			}
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("fileFolder", "muse"); //이미지폴더
		mv.addObject("museAndFileList", museAndFileList);
		mv.addObject("museAndYearList", museAndYearList);
		mv.setViewName("kr/brand/archive");
		return mv;
	}
	
	// ### 대륙에 해당하는 국가 List 를 가져온다.
	@GetMapping(value = "/store/Country")
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
	@GetMapping(value = "/store/overseas")
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
		mv.setViewName("kr/store/overseas"); // 국외
		return mv;
	}
	
	//-- 매장(국내)
	@GetMapping(value="/store/domestic")
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
		mv.addObject("areaList", Constants._JtArea); // 지역
		mv.addObject("storeList", Constants._JtStoreGubun); // 매장구분
		mv.setViewName("/kr/store/domestic"); // 국내
		return mv;
	}
	
	//-- recruit / 인재상
	@GetMapping(value="/recruit/talent")
	public ModelAndView talent() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/kr/recruit/talent"); 
		return mv;
	}
	
	//-- recruit / 직무소개
	@GetMapping(value="/recruit/recruitIntroduce")
	public ModelAndView recruitIntroduce() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/kr/recruit/recruitIntroduce"); 
		return mv;
	}
	
	//-- recruitCulture / 기업문화/복리후생
	@GetMapping(value="/recruit/recruitCulture")
	public ModelAndView recruitCulture() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/kr/recruit/recruitCulture"); 
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
		mv.setViewName("/kr/recruit/recruitList"); 
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
		mv.setViewName("/kr/recruit/recruitView"); 
		return mv;
	}
	
	//-- recruit / 인재풀등록
	@GetMapping(value="/recruit/recruitResources")
	public ModelAndView recruitResources() throws Throwable {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("/kr/recruit/recruitResources"); 
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
		
		mv.setViewName("/kr/recruit/application"); 
		return mv;
	}
	
	//-- 회사 정보
	@GetMapping(value="/company/vision")
	public String vision() {
		return "kr/company/vision";
	}
	
	@GetMapping(value="/company/history")
	public String history() {
		return "kr/company/history";
	}
	
	@GetMapping(value="/company/business")
	public String business() {
		return "kr/company/business";
	}
	
	@GetMapping(value="/company/bi")
	public String bi() {
		return "kr/company/bi";
	}
	
	@GetMapping(value="/company/contact")
	public String contact() {
		return "kr/company/contact";
	}
	
	
	
	/*
	@Autowired
	BoardService boardService;

	@Autowired
	BoardMapper boardMapper;

	@Autowired
	DocService docService;
	@Autowired
	UploadFileService fileService;

	@Autowired
	DocMapper docMapper;

	@Autowired
	CapitalService capitalService;

	@Autowired
	CapitalMapper capitalMapper;

	@Autowired
	DvidendpaidService dvidendpaidService;

	@Autowired
	DvidendpaidMapper dvidendpaidMapper;

	
	
	@Autowired
	UploadFileMapper fileMapper;

	
	@GetMapping(value="/kr/company/ceo")
	public String ceo() {
		return "kr/company/ceo";
	}

	@GetMapping(value="/kr/company/philosophy")
	public String philosophy() {
		return "kr/company/philosophy";
	}
	
	@GetMapping(value="/kr/company/subcompany")
	public String subcompany() {
		return "kr/company/subcompany";
	}

	@GetMapping(value="/kr/company/globalnetwork")
	public String globalnetwork() {
		return "kr/company/globalnetwork";
	}
	@GetMapping(value="/kr/company/management")
	public String management() {
		return "kr/company/management";
	}
	@GetMapping(value="/kr/company/organi")
	public String organi() {
		return "kr/company/organi";
	}
	@GetMapping(value="/kr/company/history")
	public String history() {
		return "kr/company/history";
	}

	@GetMapping(value="/kr/company/kiara")
	public String kiara() {
		return "kr/company/kiara";
	}
	
	@GetMapping(value="/kr/manage/capital")	
	public ModelAndView capital(HttpServletRequest request) throws Throwable {
		ParameterMap map = new ParameterMap(request); // request
		map.put("lang", "kr");

		ModelAndView mv = new ModelAndView();
		mv.addObject("uploadUrl", uploadUrl);
		
		CapitalDTO capital = capitalService.one(map);
		
		String year = capital.getYear();
		map.put("year", year);
		mv.addObject("year", year);
		
		mv.addObject("capital", capital);

		
		String[] years = capitalService.years(map);
		
		mv.addObject("years", years);
		
		List<DvidendpaidDTO> dvidendpaid = dvidendpaidService.last5list(map);
		mv.addObject("dvidendpaid", dvidendpaid);
		
		mv.setViewName("kr/manage/capital");
		return mv;
	}
	
	@GetMapping(value="/kr/manage/director_authority")
	public String director_authority() {
		return "kr/manage/director_authority";
	}
	@GetMapping(value="/kr/manage/director")
	public String director() {
		return "kr/manage/director";
	}
	@GetMapping(value="/kr/manage/director_commission")
	public String director_commission() {
		return "kr/manage/director_commission";
	}
	
	@GetMapping(value="/kr/manage/article")
	public ModelAndView article(HttpServletRequest request) throws Throwable {
		String page = "article";
		ParameterMap map = new ParameterMap(request); // request
		map.put("pseq", page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);

		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		
		DocDTO data = docService.select(page);
		mv.addObject("data", data);
		
		mv.addObject("doc_data", ComUtils.Replace_Html_Repair(data.getContents()));
		
		mv.setViewName("kr/manage/article");
		return mv;
	}
	
	@GetMapping(value="/kr/manage/disclosure")
	public String disclosure() {
		return "kr/manage/disclosure";
	}

	

	
	@GetMapping(value="/kr/ir/ir_home")
	public ModelAndView ir_home(HttpServletRequest request) throws Throwable {
		ModelAndView mv = new ModelAndView();

		ParameterMap map = new ParameterMap(request); // request
		map.put("bcode", "notice");		
		int cpage = ComUtils.objToIntDef(map.get("cpage"), 1); // 현재 페이지
		long totalRows = boardService.count(map); // 전체 게시글 수
		int pg_rows = ComUtils.objToIntDef(map.get("pg_rows"), 5); // 페이지당 표시할 레코드 수.

		PageDTO pageDto = new PageDTO(cpage, pg_rows, totalRows);
		map.put("pg_start", pageDto.getPg_start());
		map.put("pg_end", pg_rows);

		List<BoardDTO> notice = boardService.list(map);
		mv.addObject("notice", notice);

		map.put("bcode", "manage");		
		
		totalRows = boardService.count(map); // 전체 게시글 수
		pg_rows = ComUtils.objToIntDef(map.get("pg_rows"), 5); // 페이지당 표시할 레코드 수.

		pageDto = new PageDTO(cpage, pg_rows, totalRows);
		map.put("pg_start", pageDto.getPg_start());
		map.put("pg_end", pg_rows);

		List<BoardDTO> manage = boardService.list(map);
		mv.addObject("manage", manage);
		
		
		
		//최근 파일
		map.put("pg_start", 0);
		map.put("pg_end", 1);
		map.put("bcode", "annualreport");
		List<BoardDTO> annualreport_files = boardService.list(map);
		mv.addObject("annualreport_files", annualreport_files);

		map.put("bcode", "presentation");
		List<BoardDTO> presentation_files = boardService.list(map);
		mv.addObject("presentation_files", presentation_files);

		map.put("bcode", "fact_sheet");
		List<BoardDTO> fact_sheet_files = boardService.list(map);
		mv.addObject("fact_sheet_files", fact_sheet_files);

		
		
		mv.setViewName("kr/ir/ir_home");
		return mv;
	}

	@GetMapping(value="/kr/ir/notice")
	public String notice() {
		return "kr/ir/notice";
	}	
	@GetMapping(value="/kr/ir/notice_read")
	public String notice_read() {
		return "kr/ir/notice_read";
	}
	@GetMapping(value="/kr/ir/record")
	public String record() {
		return "kr/ir/record";
	}	
	@GetMapping(value="/kr/ir/record_read")
	public String record_read() {
		return "kr/ir/record_read";
	}	
	@GetMapping(value="/kr/ir/inspect")
	public String inspect() {
		return "kr/ir/inspect";
	}	
	@GetMapping(value="/kr/ir/inspect_read")
	public String inspect_read() {
		return "kr/ir/inspect_read";
	}
	@GetMapping(value="/kr/ir/manage_list")
	public String manage_list() {
		return "kr/ir/manage_list";
	}	
	@GetMapping(value="/kr/ir/manage_list_read")
	public String manage_list_read() {
		return "kr/ir/manage_list_read";
	}	
	@GetMapping(value="/kr/ir/announcement")
	public String announcement() {
		return "kr/ir/announcement";
	}	
	@GetMapping(value="/kr/ir/announcement_read")
	public String announcement_read() {
		return "kr/ir/announcement_read";
	}	
	@GetMapping(value="/kr/ir/regulations")
	public ModelAndView regulations(HttpServletRequest request) throws Throwable {
		String page = "regulations";
		ParameterMap map = new ParameterMap(request); // request
		map.put("pseq", page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);

		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		
		DocDTO data = docService.select(page);
		mv.addObject("data", data);
		
		mv.addObject("doc_data", ComUtils.Replace_Html_Repair(data.getContents()));
		
		mv.setViewName("kr/ir/regulations");
		return mv;		
	}	
	@GetMapping(value="/kr/ir/presentation")
	public String presentation() {
		return "kr/ir/presentation";
	}	
	@GetMapping(value="/kr/ir/presentation_read")
	public String presentation_read() {
		return "kr/ir/presentation_read";
	}	
	@GetMapping(value="/kr/ir/fact_sheet")
	public String fact_sheet() {
		return "kr/ir/fact_sheet";
	}	
	@GetMapping(value="/kr/ir/fact_sheet_read")
	public String fact_sheet_read() {
		return "kr/ir/fact_sheet_read";
	}	
	@GetMapping(value="/kr/ir/annualreport")
	public String annualreport() {
		return "kr/ir/annualreport";
	}	
	@GetMapping(value="/kr/ir/annualreport_read")
	public String annualreport_read() {
		return "kr/ir/annualreport_read";
	}	

	@GetMapping(value="/kr/ir/stock")
	public ModelAndView stock(HttpServletRequest request) throws Throwable {
		
		ParameterMap map = new ParameterMap(request); // request
		String gubun = ComUtils.objToStr(map.get("gubun"));
		if (gubun.equals("")) gubun="A";
		String d = ComUtils.objToStr(map.get("d"));
		if (d.equals("")) d="365";

		ModelAndView mv = new ModelAndView();
		mv.addObject("gubun", gubun);
		mv.addObject("d", d);
		mv.setViewName("kr/ir/stock");
		return mv;		
	}	
		
	
	@GetMapping(value="/kr/ir/credit")
	public String credit() {
		return "kr/ir/credit";
	}	
	
	@GetMapping(value = "/kr/ir/news_list")
	public ModelAndView news_list(HttpServletRequest request) throws Throwable {

		ModelAndView mv = new ModelAndView();
		ParameterMap map = new ParameterMap(request); //request
		
		String searchStr = map.getString("searchStr");		
		String NKEY = map.getString("NKEY");
		String currentPage = map.getString("currentPage");
		if (currentPage.equals("")) currentPage = "1";

		mv.addObject("searchStr", searchStr);
		mv.addObject("NKEY", NKEY);
		mv.addObject("currentPage", currentPage);

		mv.setViewName("/kr/ir/news_list");
		return mv;
	}
	
	@GetMapping(value = "/kr/ir/news_read")
	public ModelAndView news_read(HttpServletRequest request) throws Throwable {

		ModelAndView mv = new ModelAndView();
		ParameterMap map = new ParameterMap(request); //request
		
		String searchStr = map.getString("searchStr");		
		String NDATE = map.getString("NDATE");		
		String NTITLE = map.getString("NTITLE");		
		String NKEY = map.getString("NKEY");
		String currentPage = map.getString("currentPage");
		if (currentPage.equals("")) currentPage = "1";

		mv.addObject("searchStr", searchStr);
		mv.addObject("NDATE", NDATE);
		mv.addObject("NTITLE", NTITLE);
		mv.addObject("NKEY", NKEY);
		mv.addObject("currentPage", currentPage);

		mv.setViewName("/kr/ir/news_read");
		return mv;
	}	
	

	@GetMapping(value = "/kr/ir/news_paging")
	public ModelAndView news_paging(HttpServletRequest request) throws Throwable {
		ModelAndView mv = new ModelAndView();
		ParameterMap map = new ParameterMap(request); // request
		int totalRows = map.getInt("TOT_CNT");
		int cpage = ComUtils.objToIntDef(map.get("currentPage"), 1); // 현재 페이지
		int pg_rows = ComUtils.objToIntDef(map.get("pg_rows"), 10); // 페이지당 표시할 레코드 수.
		mv.addObject("paging", Paging.ShowPageBar(totalRows, pg_rows, cpage, 10, "<img src='/images/common/first_page.png'/>","<img src='/images/common/last_page.png'/>","<img src='/images/common/first_page.png'/>","<img src='/images/common/last_page.png'/>", "goPage"));
		mv.setViewName("/kr/ir/news_paging");
		return mv;
	}
		
	
			
	@GetMapping(value="/kr/sub/vision")
	public String vision() {
		return "kr/sub/vision";
	}	
	@GetMapping(value="/kr/sub/performance")
	public String performance() {
		return "kr/sub/performance";
	}	
	@GetMapping(value="/kr/sub/code_ethics")
	public String code_ethics() {
		return "kr/sub/code_ethics";
	}	
	
	@GetMapping(value="/kr/sub/behavior")
	public ModelAndView behavior(HttpServletRequest request) throws Throwable {
		String page = "behavior";
		ParameterMap map = new ParameterMap(request); // request
		map.put("pseq", page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);

		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		
		DocDTO data = docService.select(page);
		mv.addObject("data", data);
		
		mv.addObject("doc_data", ComUtils.Replace_Html_Repair(data.getContents()));
		
		mv.setViewName("kr/sub/behavior");
		return mv;		
	}	
	

	@GetMapping(value="/kr/sub/operation")
	public ModelAndView operation(HttpServletRequest request) throws Throwable {
		String page = "operation";
		ParameterMap map = new ParameterMap(request); // request
		map.put("pseq", page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);

		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		
		DocDTO data = docService.select(page);
		mv.addObject("data", data);
		
		mv.addObject("doc_data", ComUtils.Replace_Html_Repair(data.getContents()));
		
		mv.setViewName("kr/sub/operation");
		return mv;		
	}	

	@GetMapping(value="/kr/sub/esg")
	public String esg() {
		return "kr/sub/esg";
	}	

	@GetMapping(value="/kr/util/private")
	public ModelAndView private1(HttpServletRequest request) throws Throwable {
		String page = "private";
		ParameterMap map = new ParameterMap(request); // request
		map.put("pseq", page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);

		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		
		DocDTO data = docService.select(page);
		mv.addObject("data", data);
		
		mv.addObject("doc_data", ComUtils.Replace_Html_Repair(data.getContents()));
		
		mv.setViewName("kr/util/private");
		return mv;		
	}	

	@GetMapping(value="/kr/util/private2")
	public ModelAndView private2(HttpServletRequest request) throws Throwable {
		
		ModelAndView mv = new ModelAndView();

		String bcode = "private2";
		ParameterMap map = new ParameterMap(request); // request
		int seq = map.getInt("seq");
		
		map.put("bcode", bcode);		
		if (seq<= 0)  seq= boardService.max_seq(map);
		map.put("seq", seq);
		BoardDTO data = boardService.select(map);
		
		map.put("pseq", seq);
		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		mv.addObject("data", data);

		mv.setViewName("kr/util/private2");
		return mv;		
	}	


	@GetMapping(value="/kr/util/private3")
	public ModelAndView private3(HttpServletRequest request) throws Throwable {
		String page = "private3";
		ParameterMap map = new ParameterMap(request); // request
		map.put("pseq", page);

		ModelAndView mv = new ModelAndView();
		mv.addObject("page", page);

		List<UploadFileDTO> files = fileService.list(map);
		mv.addObject("files", files);
		
		
		DocDTO data = docService.select(page);
		mv.addObject("data", data);
		
		mv.addObject("doc_data", ComUtils.Replace_Html_Repair(data.getContents()));
		
		mv.setViewName("kr/util/private3");
		return mv;		
	}	
	
	@GetMapping(value="/kr/recruitment/talent")
	public String talent() {
		return "kr/recruitment/talent";
	}
	
	@GetMapping(value="/kr/contact/contact")
	public String contact() {
		return "kr/contact/contact";
	}
	*/
	@GetMapping(value="/sample")
	public String s1111() {
		return "sample";
	}
}
