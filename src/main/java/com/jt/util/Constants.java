package com.jt.util;

public interface Constants {
	/**
	 * 파일 유무 확인용
	 */
	String HAS_FILE_NO = "NO";
	String HAS_FILE_YES = "YES";

	/**
	 * 기타
	 */
	String CR = "\r";
	String LF = "\n";
	String CRLF = CR + LF;

	String FILE_SEPARATOR = System.getProperty("file.separator");
	String LINE_SEPARATOR = System.getProperty("line.separator");

	boolean IS_MAC = CR.equals(LINE_SEPARATOR);
	boolean IS_UNIX = LF.equals(LINE_SEPARATOR);
	boolean IS_WINDOWS = CRLF.equals(LINE_SEPARATOR);

	String CHARSET_UTF_8 = "UTF-8";
	String CHARSET_ISO_8859_1 = "ISO8859-1";
	String CHARSET_EUC_KR = "EUC-KR";
	
	public static final char kTab = (char)9;
	
	public static final String _Alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	public static final String _Alpha2 = "abcdefghijklmnopqrstuvwxyz";
	public static final String _AllowSpecial = "._";
	public static final String _AllowSpecialPw = "~!@#$^*()_+|";
	public static final String  _Num   = "0123456789";
	public static final String _AlphaNum = _Alpha+_Num;
	public static final String _AlphaNum2 = _Alpha2+_Num;
	public static final String _AllowChar = _Alpha + _AllowSpecial + _Num;
	public static final String _AllowCharPw = _Alpha + _AllowSpecialPw + _Num;
	
	public static final String [][]  _EmailDomain ={
		{"gmail.com","gmail.com"}
		,{"naver.com","naver.com"}
		,{"daum.net","daum.net)"}
		,{"korea.com","korea.com"}
		,{"lycos.co.kr","lycos.co.kr"}
		,{"nate.com","nate.com"}
		,{"empal.com","empal.com"}
		,{"hanmail.net","hanmail.net"}
		,{"hotmail.com","hotmail.com"}
		,{"dreamwiz.com","dreamwiz.com"}
		,{"freechal.com","freechal.com"}
		,{"hanafos.com","hanafos.com"}
		,{"hanmir.com","hanmir.com"}
		,{"paran.com","paran.com"}
		,{"unitel.co.kr","unitel.co.kr"}
		,{"yahoo.co.kr","yahoo.co.kr"}
		,{"chol.com","chol.com"}
	};	
	
	//대륙
	public static final String [][] _JtContinent={
			 {"AISA","AISA"}
			,{"AFRICA","AFRICA"}							
			,{"EUROPE","EUROPE"}							
			,{"AMERICA","AMERICA"}							
			,{"OCEANIA","OCEANIA"}							
	};	
	//국가Code,국가명
	public static final String [][][] _JtCountryCode={
			{
				{"AISA","Korea","Korea"},
				{"AISA","Mongolia","Mongolia"},
				{"AISA","NorthKorea","North Korea"},
				{"AISA","Japan","Japan"},
				{"AISA","China","China"},
				{"AISA","East Timor","East Timor"},
				{"AISA","Laos","Laos"},
				{"AISA","Malaysia","Malaysia"},
				{"AISA","Vietnam","Vietnam"},
				{"AISA","Brunei","Brunei"},
				{"AISA","Singapore","Singapore"},
				{"AISA","Indonesia","Indonesia"},
				{"AISA","Cambodia","Cambodia"},
				{"AISA","Thailand","Thailand"},
				{"AISA","Philippines","Philippines"},
				{"AISA","Nepal","Nepal"},
				{"AISA","MaldiveIslands","Maldive Islands"},
				{"AISA","Bangladesh","Bangladesh"},
				{"AISA","Butane","Butane"},
				{"AISA","SriLanka","Sri Lanka"},
				{"AISA","Afghanistan","Afghanistan"},				
				{"AISA","Iran","Iran"},
				{"AISA","India","India"},
				{"AISA","Pakistan","Pakistan"},
				{"AISA","Uzbekistan","Uzbekistan"},
				{"AISA","Kazakhstan","Kazakhstan"},				
				{"AISA","Kyrgyzstan","Kyrgyzstan"},
				{"AISA","Tajikistan","Tajikistan"},
				{"AISA","Turkmenistan","Turkmenistan"},
				{"AISA","Lebanon","Lebanon"},
				{"AISA","Bahrain","Bahrain"},				
				{"AISA","NorthernCyprus","Northern Cyprus"},
				{"AISA","Saudi Arabia","Saudi Arabia"},
				{"AISA","Syria","Syria"},
				{"AISA","United Arab Emirates","United Arab Emirates"},
				{"AISA","Armenia","Armenia"},
				{"AISA","Azerbaijan","Azerbaijan"},
				{"AISA","Yemen","Yemen"},
				{"AISA","Oman","Oman"},
				{"AISA","Jordan","Jordan"},
				{"AISA","Iraq","Iraq"},
				{"AISA","Israel","Israel"},
				{"AISA","Georgia","Georgia"},
				{"AISA","Catarrh","Catarrh"},
				{"AISA","Kuwait","Kuwait"},{"AISA","Cyprus","Cyprus"},
				{"AISA","Turkey","Turkey"},
				{"AISA","Palestine","Palestine"}
			}
			,
			{
				{"AFRICA","Ghana","Ghana"},
				{"AFRICA","Benin","Benin"},
				{"AFRICA","Togo","Togo"},
				{"AFRICA","SouthSudan","South Sudan"},
				{"AFRICA","Sudan","Sudan"},
				{"AFRICA","Gabon","Gabon"},				
				{"AFRICA","BurkinaFaso","Burkina Faso"},
				{"AFRICA","Seychelles","Seychelles"},
				{"AFRICA","Rwanda","Rwanda"},
				{"AFRICA","Algeria","Algeria"},
				{"AFRICA","Gambia","Gambia"},				
				{"AFRICA","SaoTomeAndPrincipe","Sao Tome and Principe"},
				{"AFRICA","Somalia","Somalia"},
				{"AFRICA","Burundi","Burundi"},
				{"AFRICA","Egypt","Egypt"},
				{"AFRICA","Guinea","Guinea"},				
				{"AFRICA","Senegal","Senegal"},
				{"AFRICA","Somaliland","Somaliland"},
				{"AFRICA","Uganda","Uganda"},
				{"AFRICA","Tunisia","Tunisia"},
				{"AFRICA","Guinea-Bissau","Guinea-Bissau"},
				{"AFRICA","SierraLeone","Sierra Leone"},
				{"AFRICA","Eritrea","Eritrea"},
				{"AFRICA","CentralAfricanRepublic","Central African Republic"},
				{"AFRICA","Namibia","Namibia"},
				{"AFRICA","Nigeria","Nigeria"},				
				{"AFRICA","Chad","Chad"},
				{"AFRICA","Ethiopia","Ethiopia"},
				{"AFRICA","DemocraticRepublicOfCongo","Democratic Republic of Congo"},
				{"AFRICA","Greek","Greek"},
				{"AFRICA","Niger","Niger"},				
				{"AFRICA","Cameroon","Cameroon"},
				{"AFRICA","Djibouti","Djibouti"},
				{"AFRICA","Libya","Libya"},
				{"AFRICA","Lesotho","Lesotho"},
				{"AFRICA","Liberia","Liberia"},	
				{"AFRICA","CapeVerde","Cape Verde"},
				{"AFRICA","Kenya","Kenya"},
				{"AFRICA","Morocco","Morocco"},
				{"AFRICA","Madagascar","Madagascar"},
				{"AFRICA","Mali","Mali"},				
				{"AFRICA","IvoryCoast","Ivory Coast"},
				{"AFRICA","Comoros","Comoros"},
				{"AFRICA","SaharaArabDemocraticRepublic","Sahara Arab Democratic Republic"},
				{"AFRICA","Malawi","Malawi"},
				{"AFRICA","Mauritania","Mauritania"},				
				{"AFRICA","RepublicOfCongo","Republic of Congo"},
				{"AFRICA","Tanzania","Tanzania"},
				{"AFRICA","Hwaguk","Hwaguk"},
				{"AFRICA","Mauritius","Mauritius"},
				{"AFRICA","Mozambique","Mozambique"},				
				{"AFRICA","Angola","Angola"},
				{"AFRICA","Zambia","Zambia"},
				{"AFRICA","Eswatini","Eswatini"},
				{"AFRICA","Zimbabwe","Zimbabwe"},
				{"AFRICA","Botswana","Botswana"}
			}
			,
			{
				{"EUROPE","Norway","Norway"},
				{"EUROPE","Malta","Malta"},
				{"EUROPE","Portugal","Portugal"},
				{"EUROPE","Germany","Germany"},
				{"EUROPE","Finland","Finland"},
				{"EUROPE","Denmark","Denmark"},				
				{"EUROPE","VaticanCity","Vatican City"},
				{"EUROPE","Russia","Russia"},
				{"EUROPE","Luxembourg","Luxembourg"},
				{"EUROPE","Italy","Italy"},
				{"EUROPE","Latvia","Latvia"},				
				{"EUROPE","BosniaAndHerzegovina","Bosnia and Herzegovina"},
				{"EUROPE","Romania","Romania"},
				{"EUROPE","Liechtenstein","Liechtenstein"},
				{"EUROPE","Poland","Poland"},
				{"EUROPE","Lithuania","Lithuania"},				
				{"EUROPE","North Macedonia","North Macedonia"},
				{"EUROPE","Moldova","Moldova"},
				{"EUROPE","Monaco","Monaco"},
				{"EUROPE","Greece","Greece"},
				{"EUROPE","Sweden","Sweden"},				
				{"EUROPE","San Marino","San Marino"},
				{"EUROPE","Belarus","Belarus"},
				{"EUROPE","Belgium","Belgium"},
				{"EUROPE","Kosovo","Kosovo"},
				{"EUROPE","Iceland","Iceland"},				
				{"EUROPE","Serbia","Serbia"},
				{"EUROPE","Bulgaria","Bulgaria"},
				{"EUROPE","Swiss","Swiss"},
				{"EUROPE","Hungary","Hungary"},
				{"EUROPE","Ireland","Ireland"},				
				{"EUROPE","Spain","Spain"},
				{"EUROPE","Slovakia","Slovakia"},
				{"EUROPE","Andorra","Andorra"},
				{"EUROPE","Montenegro","Montenegro"},
				{"EUROPE","Estonia","Estonia"},				
				{"EUROPE","Slovenian","Slovenian"},
				{"EUROPE","Ukraine","Ukraine"},
				{"EUROPE","Austria","Austria"},
				{"EUROPE","Croatia","Croatia"},
				{"EUROPE","UK","UK"},				
				{"EUROPE","Albania","Albania"},
				{"EUROPE","Czech Republic","Czech Republic"},
				{"EUROPE","France","France"},
				{"EUROPE","Netherlands","Netherlands"}
			}
			,
			{
				{"AMERICA","Guatemala","Guatemala"},
				{"AMERICA","Commonwealth","Commonwealth"},
				{"AMERICA","Belize","Belize"},
				{"AMERICA","Haiti","Haiti"},
				{"AMERICA","Canada","Canada"},
				{"AMERICA","Guatemala","Guatemala"},				
				{"AMERICA","Commonwealth","Commonwealth"},
				{"AMERICA","Belize","Belize"},
				{"AMERICA","Haiti","Haiti"},
				{"AMERICA","Canada","Canada"},
				{"AMERICA","Grenada","Grenada"},				
				{"AMERICA","Mexico","Mexico"},
				{"AMERICA","stLucia","st lucia"},
				{"AMERICA","AnticaAndBarbuda","AnticaAndBarbuda"},
				{"AMERICA","CostaRica","Costa Rica"},
				{"AMERICA","Nicaragua","Nicaragua"},				
				{"AMERICA","America","United States of America"},
				{"AMERICA","stVincent","st vincent"},
				{"AMERICA","ElSalvador","El Salvador"},
				{"AMERICA","Cuba","Cuba"},
				{"AMERICA","DominicanRepublic","Dominican Republic"}, 				
				{"AMERICA","Barbados","Barbados"},
				{"AMERICA","Grenadines","Grenadines"},
				{"AMERICA","Honduras","Honduras"},
				{"AMERICA","TrinidadAndTobago","Trinidad and Tobago"},
				{"AMERICA","Dominican","Dominican"},  				
				{"AMERICA","Bahamas","Bahamas"},
				{"AMERICA","stKittsAndNevis","st kitts and nevis"},
				{"AMERICA","Jamaica","Jamaica"},
				{"AMERICA","Panama","Panama"},
				{"AMERICA","Guyana","Guyana"}, 			
				{"AMERICA","Brazil","Brazil"},
				{"AMERICA","Ecuador","Ecuador"},
				{"AMERICA","Columbia","Columbia"},
				{"AMERICA","Chile","Chile"},
				{"AMERICA","Venezuela","Venezuela"}, 				
				{"AMERICA","surname","surname"},
				{"AMERICA","Uruguay","Uruguay"},
				{"AMERICA","Paraguay","Paraguay"},
				{"AMERICA","Peru","Peru"},
				{"AMERICA","Bolivia","Bolivia"}, 				
				{"AMERICA","Argentina","Argentina"}
			},
			{
				{"OCEANIA","Fiji","Fiji"},
				{"OCEANIA","Nauru","Nauru"},
				{"OCEANIA","NewZealand","New Zealand"},
				{"OCEANIA","MarshallIslands","Marshall Islands"},
				{"OCEANIA","Micronesia","Federated States of Micronesia"},
				{"OCEANIA","Vanuatu","Vanuatu"},
				{"OCEANIA","Solomon Islands","Solomon Islands"},
				{"OCEANIA","Kiribati","Kiribati"},
				{"OCEANIA","Tuvalu","Tuvalu"},
				{"OCEANIA","Palau","Palau"},
				{"OCEANIA","Samoa","Samoa"},
				{"OCEANIA","Australia","Australia"},
				{"OCEANIA","Tonga","Tonga"},
				{"OCEANIA","PapuaNewGuinea","Papua New Guinea"},
			}
	};
				
	
	
	//지역(KR)
	public static final String [][] _JtArea={
			 {"Area1","서울"}							
			,{"Area2","경기"}							
			,{"Area3","강원"}							
			,{"Area4","충청"}							
			,{"Area5","경상"}
			,{"Area6","전라"}
			,{"Area7","제주"}
			,{"Area8","부산"}
			,{"Area9","인천"}
			,{"Area10","대구"}
			,{"Area11","광주"}
			,{"Area12","울산"}
			,{"Area13","대전"}
	};	
	//지역(CN)
	public static final String [][] _JtCNArea={
			 {"Area1","首尔"}							
			,{"Area2","京畿"}							
			,{"Area3","江原"}							
			,{"Area4","忠清"}							
			,{"Area5","庆尚"}
			,{"Area6","全罗"}
			,{"Area7","济州"}
			,{"Area8","釜山"}
			,{"Area9","仁川"}
			,{"Area10","大邱"}
			,{"Area11","光州"}
			,{"Area12","蔚山"}
			,{"Area13","大田"}
	};	
	//지역(EN)
	public static final String [][] _JtENArea={
			 {"Area1","Seoul"}							
			,{"Area2","Gyeonggi"}							
			,{"Area3","Gangwon"}							
			,{"Area4","Chungcheong"}							
			,{"Area5","Gyeongsang"}
			,{"Area6","Jeolla"}
			,{"Area7","Jeju"}
			,{"Area8","Busan"}
			,{"Area9","Incheon"}
			,{"Area10","Daegu"}
			,{"Area11","Gwangju"}
			,{"Area12","Ulsan"}
			,{"Area13","Daejeon"}
	};	
	//브랜드(CN)
	public static final String [][] _JtCNBrand={
				 {"jewelry","J.ESTINA JEWELRY"}							
				,{"bag","J.ESTINA HANDBAG"}							
				,{"romanson","ROMANSON"}
	};
	//브랜드(EN)
	public static final String [][] _JtENBrand={
				 {"jewelry","J.ESTINA JEWELRY"}							
				,{"bag","J.ESTINA HANDBAG"}							
				,{"romanson","ROMANSON"}
	};
	//브랜드(KR)
	public static final String [][] _JtBrand={
				 {"jewelry","제이에스티나 주얼리"}							
				,{"bag","제이에스티나 핸드백"}							
				,{"romanson","로만손"}
	};

	
	//브랜드구분(KR)
	public static final String [][] _JtStoreGubun={
			 {"department","백화점"}							
			,{"outlet","아울렛"}							
			,{"dutyfree","면세점"}							
	};
	//브랜드구분(EN)
	public static final String [][] _JtStoreENGubun={
			 {"department","Department Store"}							
			,{"outlet","Outlet Store"}							
			,{"dutyfree","Duty Free Shop"}							
	};
	//브랜드구분(CN)
	public static final String [][] _JtStoreCNGubun={
			 {"department","百货商店"}							
			,{"outlet","直销店"}							
			,{"dutyfree","免税商店"}							
	};
	
	
	public static final String[] arrGubun = new String[] { "Jewelry", "Bag", "Romanson" };
	public static final String[] arrTitle = new String[] { "J.ESTINA Jewelry", "J.ESTINA Bag", "ROMANSON" };
	

	
	
}
