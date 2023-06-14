package com.eh.neighbor.board.service.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class BoardVO implements Serializable {
	
	//	사용자 ID
	private int bbsId;
	
	// 제목
	private String bbsSj;
	
	// 작성자
	private String wrter;
	
	// 내용
	private String bbsCn;
	
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
	
	// Get set

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
