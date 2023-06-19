package com.eh.neighbor.board.service.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BoardVO implements Serializable {

	// 사용자 ID
	private int bbsId;

	// 제목
	private String bbsSj;

	// 작성자
	private String wrter;

	// 내용
	private String bbsCn;
	
	// 비번
	private String password;

	// 작성일
	private String writngDt;

	// 수정일
	private String updtDt;

	// 조회수
	private int rdcnt;

	// 수정자
	private String updusr;

	// rownum
	private int rownum;

	// 검색어
	private String searchWriter;

	// 검색 카테고리
	private String searchSelect;

	// 게시글 카운트
	private int searchCount;

	// 날짜 검색
	private String searchDateL;
	private String searchDateR;
	
	// 페이지네이션
	private int prevPage;
	private int currPage;
	private int pageSize;
	private int firstPage;
	private int lastPage;
	
	
	// Getter Setter
	

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
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
		this.pageSize = pageSize;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public String getSearchDateL() {
		return searchDateL;
	}

	public void setSearchDateL(String searchDateL) {
		this.searchDateL = searchDateL;
	}

	public String getSearchDateR() {
		return searchDateR;
	}

	public void setSearchDateR(String searchDateR) {
		this.searchDateR = searchDateR;
	}
	
	public int getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	public String getSearchSelect() {
		return searchSelect;
	}

	public void setSearchSelect(String searchSelect) {
		this.searchSelect = searchSelect;
	}

	public String getSearchWriter() {
		return searchWriter;
	}

	public void setSearchWriter(String searchWriter) {
		this.searchWriter = searchWriter;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getBbsId() {
		return bbsId;
	}

	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}

	public String getBbsSj() {
		return bbsSj;
	}

	public void setBbsSj(String bbsSj) {
		this.bbsSj = bbsSj;
	}

	public String getWrter() {
		return wrter;
	}

	public void setWrter(String wrter) {
		this.wrter = wrter;
	}

	public String getBbsCn() {
		return bbsCn;
	}

	public void setBbsCn(String bbsCn) {
		this.bbsCn = bbsCn;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getWritngDt() {
		return writngDt;
	}

	public void setWritngDt(String writngDt) {
		this.writngDt = writngDt;
	}

	public String getUpdtDt() {
		return updtDt;
	}

	public void setUpdtDt(String updtDt) {
		this.updtDt = updtDt;
	}

	public int getRdcnt() {
		return rdcnt;
	}

	public void setRdcnt(int rdcnt) {
		this.rdcnt = rdcnt;
	}

	public String getUpdusr() {
		return updusr;
	}

	public void setUpdusr(String updusr) {
		this.updusr = updusr;
	}

}
