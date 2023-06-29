package com.eh.neighbor.board.service;

import java.util.List;

import com.eh.neighbor.board.service.vo.BoardVO;
import com.eh.neighbor.board.service.vo.CommentVO;


public interface BoardService  {
	
	// Create
	void writeBoard(BoardVO boardVO);
	void writeComment(CommentVO commentVO);

	// Read
	List<BoardVO> selectBoard(BoardVO boardVO);
	int searchCount(BoardVO boardVO);
	BoardVO selectPrev(BoardVO boardVO);
	BoardVO selectNext(BoardVO boardVO);

	
	// Update 
	void countBoard(BoardVO boardVO);
	BoardVO selectUpdate(BoardVO boardVO);
	void updateBoard(BoardVO boardVO);
	
	// Delete
	void deleteBoard(BoardVO boardVO);

}
