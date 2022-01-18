package com.jt.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping(value="/en")
public class EnMainController {

	@Value("${attach_upload_path}")
	private String uploadRoot;
	@Value("${attach_upload_url}")
	private String uploadUrl;

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
	BannerService bannerService;

	@Autowired
	PopupService popupService;
	
	
	@Autowired
	UploadFileMapper fileMapper;
	
	@GetMapping(value="/index")
	public ModelAndView index(HttpServletRequest request) throws Throwable {
		ModelAndView mv = new ModelAndView();
		ParameterMap map = new ParameterMap(request); // request
		
		mv.addObject("uploadUrl"  , uploadUrl);  // 이미지 경로 설정.
		map.put("pg_start", 0); 
		map.put("pg_end"  , 10);		
		map.put("lang"  , "en");
		map.put("gubun"  , "A");

		List<BannerDTO> bannerlist = null;//bannerService.list(map) ;
		mv.addObject("bannerlist", bannerlist);		

		//List<PopupDTO> popuplist = popupService.list(map) ;
		//mv.addObject("popuplist", popuplist);		
		
		
		mv.setViewName("en/index");
		return mv;
	}	
	
	
	@GetMapping(value="/company/ceo")
	public String ceo() {
		return "en/company/ceo";
	}
	
	@GetMapping(value="/company/philosophy")
	public String philosophy() {
		return "en/company/philosophy";
	}
	
	@GetMapping(value="/company/subcompany")
	public String subcompany() {
		return "en/company/subcompany";
	}
	
	@GetMapping(value="/company/globalnetwork")
	public String globalnetwork() {
		return "en/company/globalnetwork";
	}
	
	@GetMapping(value="/company/management")
	public String management() {
		return "en/company/management";
	}
	
	@GetMapping(value="/company/organi")
	public String organi() {
		return "en/company/organi";
	}
	
	@GetMapping(value="/company/history")
	public String history() {
		return "en/company/history";
	}
	

	@GetMapping(value="/contact/contact")
	public String contact() {
		return "en/contact/contact";
	}
	
	@GetMapping(value="/manage/capital")
	public ModelAndView capital(HttpServletRequest request) throws Throwable {
		ParameterMap map = new ParameterMap(request); // request
		map.put("lang", "en");

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
		
		mv.setViewName("en/manage/capital");
		return mv;
	}
	
	@GetMapping(value="/manage/director_authority")
	public String director_autority() {
		return "en/manage/director_authority";
	}
	
	@GetMapping(value="/manage/director")
	public String director() {
		return "en/manage/director";
	}
	
	@GetMapping(value="/manage/director_commission")
	public String director_commission() {
		return "en/manage/director_commission";
	}
	
	

	@GetMapping(value="/ir/ir_home")
	public ModelAndView ir_home(HttpServletRequest request) throws Throwable {
		ModelAndView mv = new ModelAndView();
		ParameterMap map = new ParameterMap(request); // request
		
		//최근 파일
		map.put("pg_start", 0);
		map.put("pg_end", 1);

		map.put("pg_start", 0);
		map.put("pg_end", 1);
		map.put("bcode", "annualreport_en");
		List<BoardDTO> annualreport_files = boardService.list(map);
		mv.addObject("annualreport_files", annualreport_files);

		map.put("bcode", "presentation_en");
		List<BoardDTO> presentation_files = boardService.list(map);
		mv.addObject("presentation_files", presentation_files);

		map.put("bcode", "fact_sheet_en");
		List<BoardDTO> fact_sheet_files = boardService.list(map);
		mv.addObject("fact_sheet_files", fact_sheet_files);

		
		
		mv.setViewName("en/ir/ir_home");
		return mv;
	}
	
	
	//@GetMapping(value="/ir/ir_home")
	//public String ir_home() {
	//	return "en/ir/ir_home";
	//}	
	
	
	@GetMapping(value="/ir/inspect")
	public String inspect() {
		return "en/ir/inspect";
	}
	
	@GetMapping(value="/ir/presentation")
	public String presentation() {
		return "en/ir/presentation";
	}
	
	@GetMapping(value="/ir/fact_sheet")
	public String fact_sheet() {
		return "en/ir/fact_sheet";
	}
	
	@GetMapping(value="/ir/annualreport")
	public String annualreport() {
		return "en/ir/annualreport";
	}
	
	@GetMapping(value="/ir/stock")
	public ModelAndView stock(HttpServletRequest request) throws Throwable {
		
		ParameterMap map = new ParameterMap(request); // request
		String gubun = ComUtils.objToStr(map.get("gubun"));
		if (gubun.equals("")) gubun="A";
		String d = ComUtils.objToStr(map.get("d"));
		if (d.equals("")) d="365";

		ModelAndView mv = new ModelAndView();
		mv.addObject("gubun", gubun);
		mv.addObject("d", d);
		mv.setViewName("en/ir/stock");
		return mv;		
	}	
	
	@GetMapping(value="/ir/credit")
	public String credit() {
		return "en/ir/credit";
	}
	
	@GetMapping(value="/sub/vision")
	public String vision() {
		return "en/sub/vision";
	}	
	
	@GetMapping(value="/sub/code_ethics")
	public String code_ethics() {
		return "en/sub/code_ethics";
	}
	
	@GetMapping(value="/sub/esg")
	public String esg() {
		return "en/sub/esg";
	}	
	
	*/
}
