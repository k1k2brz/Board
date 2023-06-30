package com.eh.neighbor.board.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eh.neighbor.board.service.BoardService;
import com.eh.neighbor.board.service.vo.BoardVO;
import com.eh.neighbor.board.service.vo.CommentVO;
import com.eh.neighbor.board.util.Pagination;

@Controller
public class BoardController {

	@Resource(name = "boardService")
	private BoardService boardService;

	// READ

	@RequestMapping("/")
	public String boardView(BoardVO boardVO, ModelMap model) throws Exception {
		
		Integer currPage = boardVO.getCurrPage();
		Integer pageCount = boardVO.getPageCount();
		
		if (currPage < 2 || currPage == null) {
			boardVO.setCurrPage(1);
			currPage = 1;
		}
		
		if (pageCount == 0 || pageCount == null) {
			boardVO.setPageCount(5);
		}
		
		boardVO.setCurrPageCount(currPage);
		
		List<BoardVO> selectBoard = boardService.selectBoard(boardVO);
		int searchCount = boardService.searchCount(boardVO);
		
		Pagination pagination = new Pagination(boardVO.getCurrPage(), searchCount, boardVO.getPageCount());

		model.addAttribute("selectBoard", selectBoard);
		model.addAttribute("pagination", pagination);
		model.addAttribute("searchBoard", boardVO);
		model.addAttribute("searchCount", searchCount);

		return "/board/BoardList";
	}
	

	// Create

	@RequestMapping("/write")
	public String boardWrite(BoardVO boardVO, ModelMap model) throws Exception {

		return "/board/BoardWrite";
	}

	@ResponseBody
	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public Map<String, Object> boardWriteAction(BoardVO boardVO) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		boardService.writeBoard(boardVO);

		try {
			map.put("resultFlag", "1");
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}

	// 게시글 하나씩 보기

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String boardUpdate(BoardVO boardVO, ModelMap model) throws Exception {
		boardService.countBoard(boardVO);
		BoardVO selectUpdate = boardService.selectUpdate(boardVO);
		BoardVO selectPrev = boardService.selectPrev(boardVO);
		BoardVO selectNext = boardService.selectNext(boardVO);

		model.addAttribute("selectUpdate", selectUpdate);
		model.addAttribute("selectPrev", selectPrev);
		model.addAttribute("selectNext", selectNext);

		return "/board/BoardUpdate";
	}
	

	// Update

	@RequestMapping(value = "/updateWrite", method = RequestMethod.POST)
	public String boardUpdateWrite(BoardVO boardVO, ModelMap model) throws Exception {

		BoardVO selectUpdate = boardService.selectUpdate(boardVO);
		model.addAttribute("selectUpdate", selectUpdate);

		return "/board/BoardUpdateWrite";
	}

	@ResponseBody
	@RequestMapping(value = "/passwordCompare", method = RequestMethod.POST)
	public Map<String, Object> boardPasswordCompare(BoardVO boardVO) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		BoardVO selectUpdate = boardService.selectUpdate(boardVO);

		if (selectUpdate.getPassword().equals(boardVO.getPassword())) {
			map.put("success", true);
			map.put("message", "비밀번호가 확인되었습니다.");
		} else {
			map.put("success", false);
			map.put("message", "비밀번호가 올바르지 않습니다.");
		}

		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/updateAction", method = RequestMethod.POST)
	public Map<String, Object> boardUpdateAction(BoardVO boardVO, ModelMap model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		boardService.updateBoard(boardVO);

		try {
			map.put("success", "success");
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}

	// Delete
	@ResponseBody
	@RequestMapping(value = "/deleteAction", method = RequestMethod.POST)
	public Map<String, Object> boardDelete(BoardVO boardVO, ModelMap model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		BoardVO selectUpdate = boardService.selectUpdate(boardVO);

		if (selectUpdate.getPassword().equals(boardVO.getPassword())) {
			map.put("success", true);
			map.put("message", "게시글이 삭제되었습니다.");
		} else {
			map.put("success", false);
			map.put("message", "비밀번호가 올바르지 않습니다.");
		}

		boardService.deleteBoard(boardVO);

		try {
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}
	
	
	
	// Comment 관련
	
	@ResponseBody
	@RequestMapping(value = "/commentAction", method = RequestMethod.POST)
	public Map<String, Object> commentWriteAction(CommentVO commentVO) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		boardService.writeComment(commentVO);

		try {
			map.put("success", "1");
			map.put("message", "요청이 성공적으로 처리되었습니다.");
			return map;
		} catch (Exception e) {
			map.put("error", e);
			return map;
		}
	}
}

/*
 * @RequestMapping(value = "/updateWrite", method = RequestMethod.POST) public
 * ModelAndView boardUpdateWrite(BoardVO boardVO, ModelMap model) throws
 * Exception {
 * 
 * Map<String, Object> map = new HashMap<String, Object>();
 * 
 * BoardVO selectUpdate = boardService.selectUpdate(boardVO);
 * model.addAttribute("selectUpdate", selectUpdate);
 * 
 * if (selectUpdate.getPassword().equals(boardVO.getPassword())) {
 * map.put("success", true); map.put("message", "비밀번호가 확인되었습니다."); } else {
 * map.put("success", false); map.put("message", "비밀번호가 올바르지 않습니다."); }
 * 
 * ModelAndView modelAndView = new ModelAndView();
 * 
 * modelAndView.setViewName("/board/BoardUpdateWrite");
 * 
 * modelAndView.addObject("data", map);
 * 
 * return modelAndView; }
 * 
 * 
 */
