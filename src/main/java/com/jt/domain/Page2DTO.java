package com.jt.domain;

public class Page2DTO {
	
	private int cpage = 1; //현재 페이지
	private int pg_rows = 10;  //한 페이지 갯수
	private long total_rows = 0; //총 갯수
	
	public Page2DTO(){
		
		if (this.cpage == 0) this.cpage=1;
		if (this.cpage > getTotal_page()) this.cpage = getTotal_page();
		
	}
	
	
	public void setCpage(int cpage) { 
		this.cpage = cpage; 
	}
	public int getCpage() {

		if (this.cpage == 0) this.cpage=1;
		if (this.cpage > getTotal_page()) this.cpage = getTotal_page();
		
		return cpage; 
	}
	
	public void setPg_rows(int pg_rows) { 
		if(pg_rows <= 0 || pg_rows > 50) { 
			this.pg_rows = 10;
			return;
		}
		if(pg_rows == 0) this.pg_rows = 10;
		
		this.pg_rows = pg_rows;
	}
	public int getPg_rows() { 
		return pg_rows; 
	}
	
	public void setTotal_rows(long total_rows) { 
		this.total_rows = total_rows; 
	}
	
	public long getTotal_rows() { 
		return total_rows; 
	}
	
	
	//-------------------------------------------------------------------------------
	//long pTotalRow, int G_PAGE_SIZE
	public int getTotal_page(){
		if (pg_rows < 10) pg_rows = 10;
		
		int rsVal = Math.round( Math.round( Math.floor(total_rows / pg_rows)));
		
		if ((total_rows % pg_rows) > 0){
			rsVal = rsVal + 1;
		}
		return rsVal;
	}

	//pg_start
	public int getPg_start(){
		if (this.cpage == 0) this.cpage=1;
		return ((cpage-1) * pg_rows);
	}
	
	//pg_end
	public int getPg_end(){
		if (this.cpage == 0) this.cpage=1;
		return cpage * pg_rows;
	}
	
}
