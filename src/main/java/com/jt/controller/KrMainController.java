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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jt.domain.CategoryDTO;
import com.jt.domain.FaqDTO;
import com.jt.domain.FrontBannerDTO;
import com.jt.domain.FrontBoardJtDTO;
import com.jt.domain.FrontCategoryDTO;
import com.jt.domain.FrontMuseDTO;
import com.jt.domain.MailUploadDTO;
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
import com.jt.util.MailSender;
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
	
	//@Autowired
	//JavaMailSender javaMailSender;
	
	
	
	
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
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("cateCode", ComUtils.StrToInt(cateCode)); //카테고리키값
		mv.setViewName("/kr/brand/romansonList");
		return mv;
	}
	
	@GetMapping(value="/brand/romansonInfo")
	public @ResponseBody String romasonList(int cateCode) throws Throwable{
		
		//int cateSeq = ComUtils.StrToInt(cateCode);
		int cateSeq =cateCode;
		
		//카테고리정보(이전,다음)
		//List<CategoryDTO> cateInfo = new ArrayList<>();
		FrontCategoryDTO frontCate = new FrontCategoryDTO();
		
		//상품리스트
		List<RomasonDTO> proList = new ArrayList<>(); 
		//카테고리리스트,첫카테고리선택
		List<CategoryDTO> cateList = categoryService.categoryList();
		
		
		//이전,다음
		//NEW ARRIVALS(추천 신상품)
		if(cateSeq==0) {
			frontCate.setSeq(0); //현재카테고리
			frontCate.setCateName("NEW ARRIVALS");
			frontCate.setPreSeq(0); //이전카테고리 : 없음
			frontCate.setPreCateName("");
			frontCate.setNextSeq(cateList.get(0).getSeq()); //다음카테고리 : 첫카테고리
			frontCate.setNextCateName(cateList.get(0).getCateName());

			proList = romasonService.FrontNewList();
		}else{
			
			frontCate = categoryService.FrontSelect(cateSeq);
			
			if(cateSeq==cateList.get(0).getSeq()) { //첫번째 카테고리일때
				frontCate.setPreSeq(0); 	//이전카테고리 : NEW ARRIVALS
				frontCate.setPreCateName("NEW ARRIVALS");
			}

			proList = romasonService.FrontList(cateSeq);
		}
		
		JSONObject jsonData = new JSONObject();
		
		jsonData.put("rs", "Y");
		jsonData.put("fileFolder", "Product"); //상품폴더
		jsonData.put("cateCode", cateCode); //카테고리키값
		jsonData.put("list", proList); //상품리스트
		jsonData.put("categoryList", cateList); //카테고리 리스트
		//jsonData.put("frontCate", frontCate); //카테고리이전,다음정보
		jsonData.put("Seq", frontCate.getSeq());
		jsonData.put("CateName", frontCate.getCateName()); 
		jsonData.put("PreSeq", frontCate.getPreSeq()); 
		jsonData.put("PreCateName", frontCate.getPreCateName()); 
		jsonData.put("NextSeq", frontCate.getNextSeq()); 
		jsonData.put("NextCateName", frontCate.getNextCateName()); 

		return jsonData.toString();		
		
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
	
	
	
	
	
	
	//-- recruit / 입사지원 메일보내기
	@PostMapping(value = "/recruit/MailSend")
	public ModelAndView MailSend(MailUploadDTO mailUpload) throws Throwable {

		
		MailSender mailSender = new MailSender();
		mailSender.sendMail();
		
		
		System.out.println("##############");
		/*
		System.out.println("### Email : " + mailUpload.getEmail());
		System.out.println("### Name : " + mailUpload.getName());
		System.out.println("### Contents : " + mailUpload.getContents());
		
		List<MultipartFile> fileList = mailUpload.getUploadFile();
		
		
		MimeMessage message= javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setTo(mailUpload.getEmail());
		helper.setSubject(mailUpload.getRecruit()+mailUpload.getName());
		helper.setText(mailUpload.getContents());
		*/
		
		/*
		for(MultipartFile aFile : fileList) {
			System.out.println("### OriginalFilename : " + aFile.getOriginalFilename());
			
			FileSystemResource file = new FileSystemResource(new File(aFile.getOriginalFilename()));
			helper.addAttachment(aFile.getOriginalFilename(), file);
		}	
		
		javaMailSender.send(message);
		*/
		

		ModelAndView mv = new ModelAndView();
		//mv.setViewName("/kr/recruit/application");
		mv.setViewName("redirect:/recruit/application");
		
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
	
	
	
	//IR : 주가정보 ///ir/infor1
	@GetMapping(value="/ir/infor1")
	public String infor1() {
		return "kr/ir/infor1";
	}
	//IR : 공시정보 ///ir/infor2
	@GetMapping(value="/ir/infor2")
	public String infor2() {
		return "kr/ir/infor2";
	}

	//NEWS : 공지사항 ///news/gongji
	@RequestMapping(value="/news/gongji" , method = {RequestMethod.GET, RequestMethod.POST})
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
		mv.setViewName("/kr/news/gongji");
	
		return mv;
		
	}
	
	//NEWS : 공지사항 상세보기
	@PostMapping(value="/news/gongjiView")
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
		mv.setViewName("/kr/news/gongjiView");
		return mv;
	}
		
	//NEWS : 뉴스 ///news/news
	@RequestMapping(value="/news/news" , method = {RequestMethod.GET, RequestMethod.POST})
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
		mv.setViewName("/kr/news/news");
		
		return mv;
	}
	//NEWS : news 상세보기
	@PostMapping(value="/news/newsView")
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
		mv.setViewName("/kr/news/newsView");
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
		mv.setViewName("/kr/ir/notice");
			
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
		mv.setViewName("/kr/ir/noticeView");
		return mv;
	}
	
	/*
	

	*/
	@GetMapping(value="/sample")
	public String s1111() {
		return "sample";
	}
}
