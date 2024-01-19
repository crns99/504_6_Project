package com.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.dao.BoardDao;
import com.board.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	BoardDao dao;
	
	public int noticeBoardCount(BoardVO searchVO) {
		return dao.noticeBoardCount(searchVO);
	}
	
	public List<BoardVO> noticeBoardList(BoardVO searchVO){
		return dao.noticeBoardList(searchVO);
	}
	
	
	
	//===============================================
	public int insert(BoardVO vo) {	//글작성
		return dao.insert(vo);
	}
// 상세보기
	public BoardVO boardDetail(BoardVO searchVO) {
		return dao.boardDetail(searchVO);
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
