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
	private int rn;

	// 검색어
	private String searchWriter;

	// 검색 카테고리
	private String searchSelect;

	// 게시글 카운트
	private int searchCount;

	// 날짜 검색
	private String searchDateL;
	private String searchDateR;
	
	// 현재 페이지
	private int currPage;
	private int pageCount;
	private int currPageCount;
	
	// comment
	private CommentVO commentVO;
	
	// Getter Setter

	public CommentVO getCommentVO() {
		return commentVO;
	}

	public void setCommentVO(CommentVO commentVO) {
		this.commentVO = commentVO;
	}

	public int getCurrPageCount() {
		return currPageCount;
	}

	public void setCurrPageCount(int currPageCount) {
		this.currPageCount = (currPage-1) * pageCount;
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

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
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

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
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
