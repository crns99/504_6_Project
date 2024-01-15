package member.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import member.board.dto.RefboardDto;
import member.board.service.RefboardService;

@Controller
public class RefBoardController {

	@Autowired
	RefboardService service;

	@GetMapping("/ref/write")
	public String writeform(@ModelAttribute("dto") RefboardDto dto) {
		return "ref/write";
	}

	@PostMapping("/ref/write")
	public String write(RefboardDto dto) {
		service.insert(dto);
		return "redirect:list";
	}

	@GetMapping("/ref/list")
	public String list(@RequestParam(name = "p", defaultValue = "1") int page, Model m) {
		// 글이 있는지 체크
		int count = service.count();//select count(*) from ref;
		if (count > 0) {

			int perPage = 10; // 한 페이지에 보일 글의 갯수
			int startRow = (page - 1) * perPage;

			List<RefboardDto> boardList = service.selectList(startRow, perPage);
			m.addAttribute("start", startRow + 1);
			m.addAttribute("bList", boardList);

			int pageNum = 5;
			int totalPages = count / perPage + (count % perPage > 0 ? 1 : 0); // 전체 페이지 수

			int begin = (page - 1) / pageNum * pageNum + 1;
			int end = begin + pageNum - 1;
			if (end > totalPages) {
				end = totalPages;
			}
			m.addAttribute("begin", begin);
			m.addAttribute("end", end);
			m.addAttribute("pageNum", pageNum);
			m.addAttribute("totalPages", totalPages);
		}
		m.addAttribute("count", count);

		return "ref/boardList";
	}

	@GetMapping("/ref/content/{no}")
	public String content(@PathVariable int no, Model m) {
		RefboardDto dto = service.selectOne(no);
		m.addAttribute("article", dto);
		return "ref/content";
	}
	
	
	
}
