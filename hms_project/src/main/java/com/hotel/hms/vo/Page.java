package com.hotel.hms.vo;

public class Page {
	// 입력용
	int pageSize; 		// 한 페이지당 출력할 글 개수
	int pageBlock; 		// 한 블럭당 페이지 개수
	String pageNum; 	// 페이지 번호
	int cnt;        	// 글개수
	
	// 자동계산
	int start; 			// 현재 페이지 시작 글번호
	int end;			// 현재 페이지 마지막 글번호
	int number;			// 출력용 글번호
	int currentPage;	// 현재 페이지 = 페이지 번호
	int pageCount;		// 페이지 개수
	
	// 출력용
	int startPage;		// 시작 페이지
	int endPage;
	
	
	public Page() {
		pageSize = 6; 		// 한 페이지당 출력할 글 개수
		pageBlock = 3; 		// 한 블럭당 페이지 개수
		
		cnt = 0;        	// 글개수
		start = 0; 			// 현재 페이지 시작 글번호
		end = 0;			// 현재 페이지 마지막 글번호
		number = 0;			// 출력용 글번호
		pageNum = "0"; 		// 페이지 번호
		currentPage = 0;	// 현재 페이지 = 페이지 번호
		
		pageCount = 0;		// 페이지 개수
		startPage = 0;		// 시작 페이지
		endPage = 0;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public int getPageBlock() {
		return pageBlock;
	}
	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getStart() {
		// 현재페이지 시작 글번호(페이지별)
		// 1 = (1 - 1) * 5 + 1;
		start = (getCurrentPage() - 1) * getPageSize() + 1;
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	public int getEnd() {
		// 현재페이지 마지막 글번호(페이지별)
		// 5 = 1 + 5 - 1;
		end = getStart() + getPageSize() - 1;
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	public int getNumber() {
		return number;
	}
	
	public void setNumber(int number) {
		// 출력용 글번호 / 최종 페이지 => 30번 / 1페이지
		// 30 = 30 - (1 - 1) * 5;
		number = cnt - (getCurrentPage() - 1) * getPageSize();
		this.number = number;
	}
	
	public String getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getCurrentPage() {
		// 글 30건 기준
		currentPage = Integer.parseInt(getPageNum()); // 현재페이지 : 1
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getPageCount() {
		// 페이지 개수 6 = (30 / 5) + (1 or 0)
		pageCount = (getCnt() / getPageSize()) + (getCnt() % getPageSize() > 0 ? 1 : 0); // 페이지 개수 + 나머지 있으면 1페이지 차지하도록 하기
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	
	public int getStartPage() {
		// 시작 페이지
		// 1 = (1 / 3) * 3 + 1;
		startPage = (getCurrentPage() / getPageBlock()) * getPageBlock() + 1;
		if(getCurrentPage() % getPageBlock() == 0) startPage -= getPageBlock();
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getEndPage() {
		// 마지막 페이지
		endPage = getStartPage() + getPageBlock() - 1;
		if(endPage > getPageCount() ) endPage = getPageCount();
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}		
	
}
