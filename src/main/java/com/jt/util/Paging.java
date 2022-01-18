package com.jt.util;

public class Paging {

	public static String ShowPageBar(long pTotalRow, int G_PAGE_SIZE, int pCurPage){
		return ShowPageBar(pTotalRow, G_PAGE_SIZE, pCurPage,10,"","","","","");
	}

	public static String ShowPageBar(long pTotalRow, int G_PAGE_SIZE, int pCurPage, int pGroupCnt){
		return ShowPageBar(pTotalRow, G_PAGE_SIZE, pCurPage,pGroupCnt,"","","","","");
	}

	public static String ShowPageBar(long pTotalRow, int G_PAGE_SIZE, int pCurPage, String goScript){
		return ShowPageBar(pTotalRow, G_PAGE_SIZE, pCurPage,10,"","","","",goScript);
	}

	public static String ShowPageBar(long pTotalRow, int G_PAGE_SIZE, int pCurPage, int pGroupCnt, String pPreImg, String pNextImg, String pFirstImg, String pLastImg, String goScript){

		int nPREV = 0;
		int nCUR = 0;
		int nNEXT = 0;
		int i = 0;
		int nPageCount = 0;
		String retVal = "";
		String strLink = "";
		String pageKubun = "";

		if (pTotalRow >= 1){

			if (ComUtils.nullToStr(goScript).equals("")) goScript = "goPage";


			nPageCount = ComUtils.GetPageCount(pTotalRow, G_PAGE_SIZE);


			nPREV = (ComUtils.floor((pCurPage - 1) / pGroupCnt) - 1) * pGroupCnt + 1;
			nCUR = (ComUtils.floor((pCurPage - 1) / pGroupCnt)) * pGroupCnt + 1;
			nNEXT = (ComUtils.floor((pCurPage - 1) / pGroupCnt) + 1) * pGroupCnt + 1;

			//[이전] 페이지 조합
			if (nPREV > 0){
				/* 전작업 페이징
				strLink = "javascript:"+goScript+"('1')";
				retVal += "<li class=\"first\"><a href=\"" + strLink + "\">" + pFirstImg + "</a></li>";
				strLink = "javascript:"+goScript+"('" + nPREV +"')";
				retVal += "<li class=\"prev\"><a href=\"" + strLink + "\">" + pPreImg + "</a></li>";
				*/
				
				strLink = "javascript:"+goScript+"('1')";
				retVal += "<a href=\"" + strLink + "\" class='first' title='첫페이지'>" + pFirstImg + "</a></li>";
				strLink = "javascript:"+goScript+"('" + nPREV +"')";
				retVal += "<a href=\"" + strLink + "\" class='prev' title='이전페이지'>" + pPreImg + "</a></li>";
				
			}else{
				//retVal += "<a href=\"#\">" + pFirstImg + "</a> ";
				//retVal += "<a href=\"#\">" + pPreImg + "</a> ";
			}
			
			
			//페이지 리스트
			retVal += "<ul>";
			i = 1;
			do{
				if (pCurPage == nCUR) {
					retVal += "<li><span class='now'>" + nCUR + "</span></li>" + pageKubun;
				}else{
					strLink = "javascript:"+goScript+"('" + nCUR +"')";
					retVal += "<li><a href=\"" + strLink + "\">" + nCUR + "</a></li>" + pageKubun;
				}
				nCUR++;
				i++;
			}while((i < (pGroupCnt+1)) && (nCUR <= nPageCount));
			retVal += "</ul>";
			
            
			//[다음] 페이지 조합
			if (nNEXT <= nPageCount) {
				strLink = "javascript:"+goScript+"('" + nNEXT +"')";
				retVal += "<a href=\"" + strLink + "\" class='next' title='다음페이지'>" + pNextImg + "</a>";

				strLink = "javascript:"+goScript+"('" + nPageCount +"')";
				retVal += "<a href=\"" + strLink + "\" class='last' title='마지막페이지'>" + pLastImg + "</a>";
			}else{
				//retVal += "<a href=\"#\">" + pNextImg + "</a> ";
				//retVal += "<a href=\"#\">" + pLastImg + "</a> ";
			}
		}
		return retVal;
	}

}
