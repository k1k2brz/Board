package com.eh.neighbor.board.service.mapper;

import java.util.List;

import com.eh.neighbor.board.service.vo.BoardVO;
import com.eh.neighbor.board.service.vo.CommentVO;

public interface BoardMapper {
	
	public void writeBoard(BoardVO boardVO);
	public void writeComment(CommentVO commentVO);
	
	public List<BoardVO> selectBoard(BoardVO boardVO);
	public int searchCount(BoardVO boardVO);
	
	public BoardVO selectUpdate(BoardVO boardVO);
	public BoardVO selectPrev(BoardVO boardVO);
	public BoardVO selectNext(BoardVO boardVO);
	public void countBoard(BoardVO boardVO);
	
	public void updateBoard(BoardVO boardVO);
	public void deleteBoard(BoardVO boardVO);
}
