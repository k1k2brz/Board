package com.eh.neighbor.board.util;

public class Pagination {
	// 페이지네이션
	private int prevPage; // 이전 페이지
	private int currPage; // 현재 페이지
	private int nextPage; // 다음 페이지

	private int pageCount; // 페이지당 게시글 수
	private int pageSize; // 페이지 이동 넘버링의 사이즈
	private int totalPageCount; // 전체 게시글 수
	private int currPageSize; // 현재 페이지 넘버링의 구간(페이지 그룹)
	private int currPageCount; // 현재 게시글 수

	private int firstPage; // 첫 페이지
	private int lastPage; // 마지막 페이지

	// Getter Setter

	public Pagination(int currentPage, int total) {

		setTotalPageCount(total);
		setCurrPage(currentPage);
		setPageCount(pageCount);
		setPageSize(pageSize);
		
		setNextPage(nextPage);
		setPrevPage(prevPage);
		
		setFirstPage(firstPage);
		setLastPage(lastPage);
		setCurrPageSize(currPageSize);
		setCurrPageCount(currPageCount);
	}
	
	public int getCurrPageCount() {
		return currPageCount;
	}

	public void setCurrPageCount(int currPageCount) {
		this.currPageCount = ((currPage-1) * pageCount);
	}
	
	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = currPage + 1;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		if (pageCount == 0) {
			this.pageCount = 5;
		} else {
			this.pageCount = pageCount;
		}
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrPageSize() {
		return currPageSize;
	}

	public void setCurrPageSize(int currPageSize) {
		this.currPageSize = (int) Math.ceil((double)currPage/pageCount);
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = currPage - 1;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = (int) Math.ceil((double)totalPageCount / pageCount);
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = ((currPageSize) * pageCount) + 1;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		int last = currPageSize+1 * pageCount;
		if (last > pageSize) {
			this.lastPage = pageSize;
		} else {
			this.lastPage = last;
		}
		
	}
}
