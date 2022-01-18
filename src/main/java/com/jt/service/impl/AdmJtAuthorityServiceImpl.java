package com.jt.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.mapper.AdmJtAuthorityMapper;
import com.jt.service.AdmJtAuthorityService;
import com.jt.util.ComUtils;
import com.jt.util.ParameterMap;

@Service
public class AdmJtAuthorityServiceImpl implements AdmJtAuthorityService {
	
	@Autowired
	private AdmJtAuthorityMapper admJtAuthMapper;
	
	
	//-- 모든 권한정보(List) 가져오기(회원정보수정폼)
	@Override
	public String[] selectAdmJtAuth(String adm_id) {
		return admJtAuthMapper.selectAdmJtAuth(adm_id); 
	}
	
	//-- Key값에 해당하는 권한 여부 가져오기(로그인된 사용자)
	@Override
	public Integer getIsnt(String key) {
				
		ParameterMap map = new ParameterMap();
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AdmDTO authAdm = (AdmDTO)principal;
			
		//총괄 관리자이면 항상 패스해준다.
		if(selectAuthManager(authAdm.getAdm_id())>0) {
			return 1;

		//개별 관리자를 체크한다.
		}else {
			map.put("admId", authAdm.getAdm_id());
			map.put("menuCode" , key);
			return admJtAuthMapper.count(map);
		}
	}

	//-- 해당 아이디가 총괄 관리자인지 확인
	@Override
	public int selectAuthManager(String adm_id) {

		ParameterMap map = new ParameterMap();
		
		map.put("admId", adm_id);
		map.put("menuCode" , "manager");
		
		return admJtAuthMapper.count(map);
	}
	

	//-- 권한 등록 하기(회원정보수정폼)
	@Override
	public void insertAdmJtAuth(HttpServletRequest request,String adm_id) {
		
		//System.out.println("########################## basic 갯수 ####### " + basic.length);
		String basic[] = request.getParameterValues("basicMgmt"); //banner,MBbanner,Mpopup
		String brand[] = request.getParameterValues("brandMgmt"); //banner,roman,muse,store
		String brdr[] = request.getParameterValues("brdrMgmt"); //notice,alim,news
		String recruit[] = request.getParameterValues("recruitMgmt"); //recruit,faq
		
		String ChkManager = ComUtils.objToStr(request.getParameter("ChkManager")); //전체관리자
		
		if(ChkManager.equals("manager")) {

			ParameterMap map = new ParameterMap( request );  // request
			map.put("adm_id", adm_id); 
			map.put("menu_code", "manager"); //권한코드 
			admJtAuthMapper.insertAdmJtAuth(map); //(아이디,권한코드) 

		} else {	
			// Collections, List를 이용해 배열을 묶음
			List<String> list = new ArrayList<String>();
			if(basic != null) Collections.addAll(list, basic);
			if(brand != null) Collections.addAll(list, brand);
			if(brdr != null) Collections.addAll(list, brdr);
			if(recruit != null) Collections.addAll(list, recruit);
			
			
			if (list.size()>0) { 
				//System.out.println("Collections를 이용한 배열 합치기 : " + Arrays.stream(result).collect(Collectors.toList()));
				String[] result = list.toArray(new String[list.size()]);
			
				ParameterMap map = new ParameterMap( request );  // request
				map.put("adm_id", adm_id); //권한코드
	
				for(int i=0; i<result.length; i++) ////System.out.println("*************************** "+ i +" *****" + basic[i]);
				{
					if(result[i] != "") {
						map.put("menu_code", result[i]); //권한코드 
						admJtAuthMapper.insertAdmJtAuth(map); //저장해주세요.(아이디,권한코드) 
					}
				}
			}
		}	
	}
	
	//-- 권한 삭제 하기(회원정보수정폼)
	@Override
	public void deleteAdmJtAuth(String adm_id) {
		admJtAuthMapper.deleteAdmJtAuth(adm_id); //모든권한 삭제해 주세요. 
	}	
	

}
