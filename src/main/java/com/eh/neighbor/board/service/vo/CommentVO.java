package com.eh.neighbor.board.service.vo;

import java.io.Serializable;

@SuppressWarnings("serial")
public class CommentVO implements Serializable {

	// 사용자 ID
	private int bbsId;

	// 댓글 ID
	private int answerId;

	// 작성자
	private String answerWrter;

	// 내용
	private String answerCn;

	// 비번
	private String password;

	// 작성일
	private String writngDt;

	// 수정일
	private String updtDt;

	// 수정자
	private String answerUpdusr;
	
	
	// Getter Setter
	
	public int getBbsId() {
		return bbsId;
	}

	public void setBbsId(int bbsId) {
		this.bbsId = bbsId;
	}

	public int getAnswerId() {
		return answerId;
	}

	public void setAnswerId(int answerId) {
		this.answerId = answerId;
	}

	public String getAnswerWrter() {
		return answerWrter;
	}

	public void setAnswerWrter(String answerWrter) {
		this.answerWrter = answerWrter;
	}

	public String getAnswerCn() {
		return answerCn;
	}

	public void setAnswerCn(String answerCn) {
		this.answerCn = answerCn;
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

	public String getAnswerUpdusr() {
		return answerUpdusr;
	}

	public void setAnswerUpdusr(String answerUpdusr) {
		this.answerUpdusr = answerUpdusr;
	}
}
