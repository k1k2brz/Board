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
	
	BoardVO selectUpdate(BoardVO boardVO);
	List<CommentVO> selectComment(CommentVO commentVO);

	
	// Update 
	void countBoard(BoardVO boardVO);
	void updateBoard(BoardVO boardVO);
	
	CommentVO commentCompare(CommentVO commentVO);
	void updateComment(CommentVO commentVO);
	
	// Delete
	void deleteBoard(BoardVO boardVO);
	void deleteComment(CommentVO commentVO);

}
