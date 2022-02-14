package com.jt.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.jt.domain.AdmDTO;
import com.jt.domain.SearchDTO;
import com.jt.domain.StoreDTO;
import com.jt.mapper.StoreMapper;
import com.jt.service.StoreService;
import com.jt.util.ComUtils;
import com.jt.util.Constants;
import com.jt.util.ParameterMap;

@Service
public class StoreServiceImpl implements StoreService {

	
	@Autowired
	private StoreMapper storeMapper;

	// 로그인 정보
	public AdmDTO AdminInfo() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return (AdmDTO) principal;
	}

	// -- Lang
	public String setLangStr(String[] arrLang) {

		String lang = "";
		if (arrLang != null) {
			if (arrLang.length > 0) {
				for (int i = 0; i < arrLang.length; i++) {
					if (!arrLang[i].equals(""))
						lang += ComUtils.objToStr(arrLang[i]) + "/"; // KR/EN/CN/
				}
				lang = lang.substring(0, lang.length() - 1); // 뒤 부분 '/'를 빼준다.
			}
		}
		return lang;
	}

	@Override
	public void insertAndUpdate(StoreDTO store, HttpServletRequest request) {

		// -- Lang setting
		String[] arrLang = request.getParameterValues("langArr");
		// if(arrLang != null)
		store.setLang(setLangStr(arrLang)); // 뒤 부분 '/'를 빼준다.
		// -- admId setting
		store.setAdmId(AdminInfo().getAdm_id());

		storeMapper.insertAndUpdate(store);
	}

	@Override
	public void delete(int seq) {
		storeMapper.delete(seq);
	}

	@Override
	public StoreDTO select(int seq) {
		return storeMapper.select(seq);
	}

	@Override
	public List<StoreDTO> list(SearchDTO search, String gubun) {

		search.setKeyGubun(gubun);
		List<StoreDTO> storeList = storeMapper.list(search);

		// --------------------------------------------------------------------
		if (gubun.equals("Domestic")) {

			Map<String, String> AreaMap = new HashMap<String, String>();
			Map<String, String> BrandMap = new HashMap<String, String>();
			Map<String, String> StoreMap = new HashMap<String, String>();

			String [][] StoreGubun;
			String [][] StoreArea;
			String [][] StoreBrand;
			if(search.getKeyIsnt().equals("CN")) {
				StoreGubun = Constants._JtStoreCNGubun;
				StoreArea = Constants._JtCNArea;
				StoreBrand = Constants._JtCNBrand;
			} else if(search.getKeyIsnt().equals("EN")) {
				StoreGubun = Constants._JtStoreENGubun;
				StoreArea = Constants._JtENArea;
				StoreBrand = Constants._JtENBrand;
			} else {
				StoreGubun = Constants._JtStoreGubun;
				StoreArea = Constants._JtArea;
				StoreBrand = Constants._JtBrand;
			}
			
			for (int i = 0; i < StoreArea.length; i++) {
				String[] inArr = StoreArea[i];
				AreaMap.put(inArr[0], inArr[1]);
			}
			for (int i = 0; i < StoreBrand.length; i++) {
				String[] inArr = StoreBrand[i];
				BrandMap.put(inArr[0], inArr[1]);
			}
			for (int i = 0; i < StoreGubun.length; i++) {
				String[] inArr = StoreGubun[i];
				StoreMap.put(inArr[0], inArr[1]);
			}

			for (StoreDTO store : storeList) {
				if (AreaMap.containsKey(store.getValue1()))
					store.setValue1(AreaMap.get(store.getValue1()));

				if (BrandMap.containsKey(store.getValue2()))
					store.setValue2(BrandMap.get(store.getValue2()));

				if (StoreMap.containsKey(store.getValue3()))
					store.setValue3(StoreMap.get(store.getValue3()));
			}

			// --------------------------------------------------------------------
		} else {

			Map<String, String> ContinentMap = new HashMap<String, String>();
			for (int i = 0; i < Constants._JtContinent.length; i++) {
				String[] inArr = Constants._JtContinent[i];
				ContinentMap.put(inArr[0], inArr[1]);
			}

			for (StoreDTO store : storeList) {
				if (ContinentMap.containsKey(store.getValue1()))
					store.setValue1(ContinentMap.get(store.getValue1()));

				for (int i = 0; i < Constants._JtCountryCode.length; i++) {
					String[][] inArr = Constants._JtCountryCode[i];
					for (int j = 0; j < inArr.length; j++) {
						String[] in2Arr = inArr[j];
						if (in2Arr[1].equals(store.getValue2())) {
							store.setValue2(in2Arr[2]);
							break;
						}
					}
				}
			}
		}

		return storeList;
	}

	@Override
	public int count(SearchDTO search, String gubun) {
		search.setKeyGubun(gubun);
		return storeMapper.count(search);
	}

	@Override
	public int totalCount(String gubun) {
		return storeMapper.totalCount(gubun);
	}
	
	//-- sortChange 
	@Override
	public void sortChange(ParameterMap param) {
				
		String changeSeq = param.getString("changeSeq");
		String changeKey = param.getString("changeKey");
		String gubun = param.getString("gubun");
		
		StoreDTO sotre = storeMapper.select(Integer.parseInt(changeSeq));
		String sortIdx = sotre.getSortIdx();
		
		if(changeKey.equals("Up") || changeKey.equals("Down")) {
			
			//CHANGE 할 데이타 구함
			param.put("sortIdx", sortIdx);
			param.put("gubun", gubun);
			if(changeKey.equals("Up")) {
				sotre = storeMapper.UpSelect(param);
			}else{
				sotre = storeMapper.DownSelect(param);
			}
			
			System.out.println("########## changeSeq :" + changeSeq);
			System.out.println("########## sotre.getSeq() :" + sotre.getSeq());
			
			//CHANGE
			param.put("seq", changeSeq);
			param.put("sortIdx", sotre.getSortIdx());
			storeMapper.sortChange(param);
			
			param.put("seq", sotre.getSeq()); //up,down교체할 키값
			param.put("sortIdx", sortIdx);
			storeMapper.sortChange(param);
		}	
	}
	
}
