package com.jt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.jt.domain.SearchDTO;
import com.jt.service.AdmJtAuthorityService;
import com.jt.service.AdmJtService;
import com.jt.util.AdmJtMenu;
import com.jt.util.ComUtils;
import com.jt.util.Paging;
import com.jt.util.ParameterMap;

@Controller
public class AdmManagerController {
	
	// 권한키값(메인배너관리,메인브랜드배너관리),redirect
	private static final String authorityKey = "manager";
	private static final String authorityHome = "redirect:/jtadm/";

	//log
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	AdmJtAuthorityService admJtAuthService;
	
	@Autowired
	AdmJtService admJtService;
	
	//로그인 정보
	@ModelAttribute("authAdm")
	public AdmDTO getAuthAdm() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO)principal; 
	}

	//관리자 메뉴 정보
	@ModelAttribute("ArrayAdmJtMenu")
	public String[][][] getArrayAdmJtMenu() {
		return AdmJtMenu.ArrayAdmJtMenu; 
	}
	
	//############## 회원 아이디 체크 (등록폼에서) ########
	@GetMapping(value="/jtadm/manager/idCheck")
	public @ResponseBody int idCheck(String id) throws Throwable{
		
		SearchDTO search = new SearchDTO();
		
		search.setKey("adm_id");
		search.setKeyword(id);
		
		return admJtService.selectCnt(search);
	}
	
	//############## 회원정보를 받아옴(Top 수정폼) ########
	@GetMapping(value = "/jtadm/manager/myPageView")
	public @ResponseBody String myPageView(@ModelAttribute("authAdm") AdmDTO authAdm) throws Throwable {
		
		System.out.println(authAdm.getAdm_id());
		AdmDTO admDto = admJtService.selectPopAdm(authAdm.getAdm_id());
		
		// 성공했을때
		JSONObject jsonData = new JSONObject();
		jsonData.put("department", admDto.getDepartment()); // 정상
		jsonData.put("hp", admDto.getHp()); // 정상
		
		return jsonData.toString();
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
			
	//############## 회원정보를 받아옴(수정폼) ########
	@GetMapping(value="/jtadm/manager/memberInfo")
	public @ResponseBody String memberInfo(HttpServletRequest request) throws Throwable{
			
		ParameterMap map = new ParameterMap( request );  // request
			
		String id = ComUtils.objToStr(map.get("id")); 
		
		AdmDTO admDto = admJtService.selectPopAdm(id);
		System.out.println(admDto.toString());
		
		//admDTO.getAdm_pw()
		//성공했을때
		JSONObject jsonData = new JSONObject();
		jsonData.put("admID", admDto.getAdm_id()); //정상
		jsonData.put("admNAME", admDto.getAdm_name()); //정상
		jsonData.put("admHP", admDto.getHp()); //정상
		jsonData.put("admREGDATE", admDto.getRegdate().substring(0,10)); //정상
		jsonData.put("admDEPART", admDto.getDepartment()); //정상
		
		
		//권한정보 select 해서 jsonData로 보내주세요...
		String[] list = admJtAuthService.selectAdmJtAuth(id);
		for(String menuCode : list){
			System.out.println("#######################" + menuCode);
			if(menuCode.equals("Mbanner")) jsonData.put("MbannerChk", "checked"); //정상
			if(menuCode.equals("Mpopup")) jsonData.put("MpopupChk", "checked"); //정상
			if(menuCode.equals("MBbanner")) jsonData.put("MBbannerChk", "checked"); //정상
			if(menuCode.equals("banner")) jsonData.put("bannerChk", "checked"); //정상
			if(menuCode.equals("roman")) jsonData.put("romanChk", "checked"); //정상
			if(menuCode.equals("muse")) jsonData.put("museChk", "checked"); //정상
			if(menuCode.equals("store")) jsonData.put("storeChk", "checked"); //정상
			if(menuCode.equals("notice")) jsonData.put("noticeChk", "checked"); //정상
			if(menuCode.equals("alim")) jsonData.put("alimChk", "checked"); //정상
			if(menuCode.equals("news")) jsonData.put("newsChk", "checked"); //정상
			if(menuCode.equals("recruit")) jsonData.put("recruitChk", "checked"); //정상
			if(menuCode.equals("faq")) jsonData.put("faqChk", "checked"); //정상
			if(menuCode.equals("manager")) jsonData.put("managerChk", "checked"); //정상(총괄관리자 manager)
			//if(menuCode.equals("manager")) jsonData.put("manager", "checked"); //정상(총괄관리자 manager)
		}	
				
		//return
		return jsonData.toString();		

	}
		
	//== 회원 삭제 Proc
	@PostMapping(value="/jtadm/manager/memberDel")
	public ModelAndView memberDel(HttpServletRequest request
								, @ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra ) throws Throwable{
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}	

		ParameterMap map = new ParameterMap( request );  // request
		String id = ComUtils.objToStr(map.get("updateID")); //수정할 아이디
		
		//총괄 관리자 인지 Check     
		if(admJtAuthService.selectAuthManager(id)>0) {
			ra.addFlashAttribute("msg", "deleteNon"); //삭제할수 없어요.
			//System.out.println("########## 삭제할수 없어요.");
		} else {
			//회원정보 삭제 
			admJtService.deleteAdm(id); //회원삭제,ROLL삭제
			admJtAuthService.deleteAdmJtAuth(id); //해당 아이디의 권한 삭제
			ra.addFlashAttribute("msg", "deleteOK"); //삭제 성공여부
			//System.out.println("########## 회원정보삭제.");
		}
		ra.addFlashAttribute("search",search);
		mv.setViewName("redirect:/jtadm/manager/memberList");
		return mv;
	}
	
			
	//##### 회원 등록 및 수정 Proc #####################################
	@PostMapping(value="/jtadm/manager/memberProc")
	public ModelAndView memberProc(HttpServletRequest request
								, @ModelAttribute("AdmDTO") AdmDTO adm
								, @ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra ) throws Throwable{

		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}		
		
		ParameterMap map = new ParameterMap( request );  // request
		String processKey = ComUtils.objToStr(map.get("processKey"));
		String updateID = ComUtils.objToStr(map.get("updateID")); //수정할 아이디
		
		//회원정보 가입 
		if(processKey.equals("insert")) {
			ra.addFlashAttribute("msg", "insertOK"); //성공여부
			
			admJtService.insertPopAdm(adm);
			admJtAuthService.insertAdmJtAuth(request,adm.getAdm_id()); //해당 아이디의 새로운 권한 부여
			
		//회원정보 수정 	
		}else if(processKey.equals("update")) {
			ra.addFlashAttribute("msg", "updateOK"); //성공여부

			admJtService.updatePop2Adm(adm, map);
			admJtAuthService.deleteAdmJtAuth(updateID); //해당 아이디의 권한 모두 reset
			admJtAuthService.insertAdmJtAuth(request,updateID); //해당 아이디의 새로운 권한 부여
		}

		ra.addFlashAttribute("search", search); 
		mv.setViewName("redirect:/jtadm/manager/memberList");
		return mv;
	}
	//#########################################################
				

	
	//############## 관리자 정보 리스트 #####################################
	@GetMapping(value="/jtadm/manager/memberList")
	public ModelAndView memberList(@ModelAttribute("search") SearchDTO search
								, RedirectAttributes ra) throws Throwable{
		
		// ** 권한 여부에 따른 페이지 이동
		ModelAndView mv = new ModelAndView();
		if (admJtAuthService.getIsnt(authorityKey) == 0) { // 권한 없음
			ra.addFlashAttribute("msg", "authorityKeyFalse");
			mv.setViewName(authorityHome);
			return mv;
		}
		
		search.setTotal_rows(admJtService.selectCnt(search)); //search에 총 글수를 넣어준다.
		List<AdmDTO> list = admJtService.selectAdmList(search) ;
		
		mv.addObject("totalCount", admJtService.totalCount()); 
		mv.addObject("list", list);		
		mv.addObject("paging", Paging.ShowPageBar(search.getTotal_rows()			/* 전체 low수 */ 
									, ComUtils.objToIntDef(search.getPg_rows(),10)  /* 페이지 당 레코드 수 => 없으면 10*/ 
									, ComUtils.objToIntDef(search.getCpage(),1)		/* 현재 페이지 => 없으면 1 */
									, 10, "이전페이지","다음페이지","첫페이지","마지막페이지","goPage"));
		mv.addObject("page", search) ;
		mv.setViewName("/adm/manager/memberList");
		return mv;
	}
	//#########################################################
	
	
	
	
	
	//############## 관리자 MyPage 정보 수정 (MyPage:부서,비밀번호 변경) ########
	@PostMapping(value="/jtadm/manager/myPageProc")
	public @ResponseBody String myPageProc(HttpServletRequest request
										, @ModelAttribute("AdmDTO") AdmDTO admDto) throws Throwable{
		JSONObject jsonData = new JSONObject();
		try {
			ParameterMap map = new ParameterMap( request );  // request
			admJtService.updatePopAdm(map);

			jsonData.put("rs", "Y"); //정상
		}catch(Exception e) {
			jsonData.put("rs", "N"); //오류
		}
		
		return jsonData.toString();		
	}
}


/*
@PutMapping("/user")
public ResponseDto<Integer> update(@RequestBody User user){
    userService.update(user);
    // 여기서는 트랜잭션이 종료되기 때문에 DB값은 변경이 됐음
    // 하지만 세션값은 변경되지 않은 상태이기때문에 세션값 갱신이 필요함

    
    return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
}
@Transactional
public void update(User user){
    // 수정시에는 영속성 컨텍스트 User 오브젝트를 영속화시키고 영속화된 User 오브젝트를 수정
    // SELECT를 해서 User오브젝트를 DB로부터 가져오는 이유는 영속화를 하기위함
    // 영속화된 오브젝트를 변경하면 자동으로 DB에 update를 날려주기때문
    User persistance = userRepository.findById(user.getId()).orElseThrow(()->{
        return new IllegalArgumentException("회원 찾기 실패!!");
    });
    String rawPassword = user.getPassword();
    String encPassword = bCryptPasswordEncoder.encode(rawPassword);
    persistance.setPassword(encPassword);
    persistance.setEmail(user.getEmail());

    // 회원수정 함수 종료시 서비스종료 = 트랜잭션 종료 = commit 이 자동으로 실행
    // 영속화된 persistance 객체의 변화가 감지되면 더티체킹이 되어 update문을 날려줌
}
*/

