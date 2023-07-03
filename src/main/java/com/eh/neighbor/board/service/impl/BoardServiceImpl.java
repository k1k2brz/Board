package com.eh.neighbor.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.eh.neighbor.board.service.BoardService;
import com.eh.neighbor.board.service.mapper.BoardMapper;
import com.eh.neighbor.board.service.vo.BoardVO;
import com.eh.neighbor.board.service.vo.CommentVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "boardMapper")
	private BoardMapper boardMapper;
	
	@Override
	public void writeBoard(BoardVO boardVO) {
		boardMapper.writeBoard(boardVO);
	}
	
	@Override
	public void writeComment(CommentVO commentVO) {
		boardMapper.writeComment(commentVO);
	}
	
	@Override
	public List<BoardVO> selectBoard(BoardVO boardVO) {
		return boardMapper.selectBoard(boardVO);
	}
	
	
	@Override
	public int searchCount(BoardVO boardVO) {
		return boardMapper.searchCount(boardVO);
	}

	@Override
	public BoardVO selectPrev(BoardVO boardVO) {
		return boardMapper.selectPrev(boardVO);
	}
	
	@Override
	public BoardVO selectNext(BoardVO boardVO) {
		return boardMapper.selectNext(boardVO);
	}
	
	@Override
	public BoardVO selectUpdate(BoardVO boardVO) {
		return boardMapper.selectUpdate(boardVO);
	}
	
	@Override
	public List<CommentVO> selectComment(CommentVO commentVO) {
		return boardMapper.selectComment(commentVO);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		boardMapper.updateBoard(boardVO);
	}
	
	@Override
	public CommentVO commentCompare(CommentVO commentVO) {
		return boardMapper.commentCompare(commentVO);
	}
	
	@Override
	public CommentVO updateComment(CommentVO commentVO) {
		return boardMapper.updateComment(commentVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardMapper.deleteBoard(boardVO);
	}
	
	@Override
	public void deleteComment(CommentVO commentVO) {
		boardMapper.deleteComment(commentVO);
	}

	@Override
	public void countBoard(BoardVO boardVO) {
		boardMapper.countBoard(boardVO);
	}
}
