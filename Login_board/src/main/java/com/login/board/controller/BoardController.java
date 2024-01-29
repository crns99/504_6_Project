package com.login.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.login.board.service.BoardService;
import com.login.board.util.PaginationInfo;
import com.login.board.vo.BoardVO;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BoardController {
	private final Logger Logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	BoardService boardService;	
	
	@RequestMapping("board/notice/boardList.do")
	public String noticeBoardList(@ModelAttribute("searchVO") BoardVO searchVO, ModelMap model) {
		
		PaginationInfo paginationInfo = new PaginationInfo();
		
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getRecordCountPerPage());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		List<BoardVO> resultList = boardService.noticeBoardList(searchVO);		//리스트		
		int totCnt = boardService.noticeBoardCount(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("resultCnt", totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "board/notice/boardList";
	}
	
	
	//글 작성(boardWrite)
	@RequestMapping("/board/notice/boardwrite.do")
	public String writeForm(@ModelAttribute("searchVO") BoardVO searchVO, ModelMap model) {
		return "board/notice/boardWrite";
	}

	@RequestMapping("/board/notice/saveboardwrite.do")
	public String write(BoardVO boardvo) {
		boardService.insert(boardvo);
		return "redirect:/board/notice/boardList.do";// 글목록
	}
	
	//상세보기(boardDetail)
	@RequestMapping("/baord/notice/BoardDetail.do")
	public String boardDetail(@ModelAttribute("searchVO") BoardVO searchVO, ModelMap model){
		BoardVO boarddetail = boardService.boardInfo(searchVO);
		model.addAttribute("boardDetail", boarddetail);
		boardService.addViews(searchVO);
		return "board/notice/boardDetail";
	}
	
	//게시글 수정
	@RequestMapping("/baord/notice/boardUpdate.do")
	public String updateForm(@ModelAttribute("searchVO") BoardVO searchVO, ModelMap model){
		BoardVO boardInfo = boardService.boardInfo(searchVO);
		model.addAttribute("boardInfo", boardInfo);
		return "board/notice/boardUpdate";
	}
		 
	@RequestMapping("/board/notice/saveboardupdate.do")
	public String boardUpdate(BoardVO searchVO) { 
		boardService.boardUpdate(searchVO);
		return "redirect:/board/notice/boardList.do";// 글목록
	}

	@RequestMapping("/board/notice/deleteboard.do")
	public String delate(BoardVO searchVO) {
		boardService.deleteBoard(searchVO);
		return "redirect:/board/notice/boardList.do";// 글목록-
	}
	
	
	
	
//	@RequestMapping("board/notice/boardList.do")
//	public String noticeBoardList(Model model){
////		List<BoardVO> boardList = boardService.boardList(0, 10);
////		int boardcount = boardService.count();
////		model.addAttribute("resultList", boardList);
////		model.addAttribute("resultCount", boardcount);
////		return "notice/boardList";
//		
//		List<BoardVO> boardList = boardService.noticeBoardList();	//리스트
//		model.addAttribute("resultList", boardList);
//		
//		//int totCnt = boardService.selectBoardListCnt(searchVO);	//전체 카운트
//		
//		//model.addAttribute("resultCnt", totCnt);
//		//model.addAttribute("paginationInfo", paginationInfo);
//		return "board/notice/boardList";
//		
//	}
	
	
//	@GetMapping("/board/notice/content/{no}")
//	public String content(@PathVariable int no, Model m) {
//		BoardVO boardvo = boardService.boardOne(no);
//		m.addAttribute("boardvo", vo);
//		
//		List<CommVO> cList = commService.selectComm(no);
//		m.addAttribute("cList", cList);
//		
//		return "board/notice/content";
//	}
//		
}