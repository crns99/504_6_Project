package com.login.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.login.board.dao.BoardDao;
import com.login.board.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	BoardDao dao;
	
	public int noticeBoardCount(BoardVO searchVO) {
		return dao.noticeBoardCount(searchVO);
	}
	
	//게시글 리스트
	public List<BoardVO> noticeBoardList(BoardVO searchVO){
		return dao.noticeBoardList(searchVO);
	}
	
	//게시글 작성
	public int insert(BoardVO vo) {
		return dao.insert(vo);
	}
	//게시글 상세보기
	public BoardVO boardInfo(BoardVO searchVO) {
		return dao.boardInfo(searchVO);
	}
	//게시글 수정
	public void boardUpdate(BoardVO searchVO) {
		dao.boardUpdate(searchVO);
		
	}
	//게시글 삭제
	public void deleteBoard(BoardVO searchVO) {
		dao.deleteBoard(searchVO);
		
	}

	//조회수
	public void addViews(BoardVO searchVO) {
		dao.addViews(searchVO);
		
	}	
	
//	public List<BoardVO> noticeBoardList(){
//		return dao.noticeBoardList();
//	}


//	public int selectBoardListCnt(BoardVO searchVO) throws Exception {
//		int cnt = dao.selectBoardListCnt(searchVO);
//		return cnt;
//	}

//	public BoardDto boardOne(int no) {
//		dao.addReadcount(no);//조회수 증가
//		return dao.boardOne(no);
//	}
//	public int updateBoard(BoardDto dto) {
//		return dao.updateBoard(dto);
//	}
//	public int deleteBoard(int no) {
//		return dao.deleteBoard(no);
//	}
//	
//	public List<BoardDto> boardListSearch(int searchn, String search,int start){
//		Map<String,Object> m = new HashMap<String, Object>();
//		m.put("searchn",searchn);
//		m.put("search", search);
//		m.put("start", start);
//		m.put("count", 10);
//		
//		return dao.boardListSearch(m);
//	}
//	public int countSearch(int searchn, String search) {
//		//System.out.println(searchn+search);
//		Map<String,Object> m = new HashMap<String, Object>();
//		m.put("searchn",searchn);
//		m.put("search", search);
//		return dao.countSearch(m);
//	}
}
