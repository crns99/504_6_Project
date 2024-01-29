package com.example.proj.controller;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import com.example.proj.service.PurchaseService;
import com.example.proj.dto.BuyinfoDto;
import com.example.proj.dto.MemDto;
import com.example.proj.service.MemService;
import com.example.proj.service.BuyInfoService;

@Controller
@SessionAttributes("user")
public class MemController {
	@Autowired
	MemService service;
	 @Autowired
	    BuyInfoService buyInfoService;
	 @Autowired
	    private PurchaseService purchaseService;
	
	@ModelAttribute("user")
	public MemDto getDto() {
		return new MemDto();
	}
	 
	@GetMapping("/insert")
	public String selectedType() {
		return "sign_up";
	}
	
	@GetMapping("/find_idpw")
	public String findidpw() {
		return "find_idpw";
	}
	
	@PostMapping("/findid")
	@ResponseBody public String findId(MemDto dto) { 
		return service.findId(dto); 
	}
		  
	@PostMapping("/findpw")
	@ResponseBody public String findPw(MemDto dto) { 
		return service.findPw(dto); 
	}
	
	@GetMapping("/member_sign")
	public String member_sign(@RequestParam("type")String type, Model m ) {
		m.addAttribute("type", type); 
		return "member_sign";
	}
	
	
	@GetMapping("/pt_sign") 
	public String pt_sign(@RequestParam("type")String type, Model m ) { 
		m.addAttribute("type", type); 
		return "pt_sign"; 
	}
	 
    
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam(name = "id")String id) {
		String checkid = service.idCheck(id);
		return checkid;//text
	}
	
	@PostMapping("/insertTrainer") 
	public String insertTrainer(MemDto dto){
		service.insertTrainer(dto); 
		return "redirect:login"; 
	}
	
	@PostMapping("/insert")
	public String insert(MemDto dto) {
		service.insert(dto);
		return "redirect:login";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute("command") @Validated MemDto dto, BindingResult error, Model m) {

		if(error.hasErrors()) {
			return "login";
		}
		MemDto resultDto = service.login(dto);
		if(resultDto == null) {
			error.reject("nocode", "로그인 실패: 아이디나 비밀번호가 틀림");	
			return "login";
		}else {//로그인 성공
			m.addAttribute("user", resultDto);
		}	
		return "redirect:/main";
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}
	
	@GetMapping("/fix_info")
	public String fix_info() {
		return "fix_info";
	}
	
	@PutMapping("/fix_info")
	public String fix_info(@ModelAttribute("user") MemDto dto) {
		service.fix_info(dto);
		return "redirect:/main";
	}
	
	@RequestMapping("/main")
	public String main(@ModelAttribute("user") MemDto dto) {
		if(dto.getId() != null) {
			return "main";
		}else {
			return "login";
		}
	}
	  @GetMapping("/mypage_user")
	    public String getUserInfoFromSession(@ModelAttribute("user") MemDto dto, Model model) {
	        String userId = dto.getId();
	        model.addAttribute("userId", userId);
	        List<MemDto> buyInfoList = service.selectAllByMemberID(userId);

	        if (!buyInfoList.isEmpty()) {
	            // 해당 ID를 가진 데이터가 있을 경우
	            
	            // buyInfoList를 모델에 추가하거나 필요한 작업 수행
	            model.addAttribute("buyInfoList", buyInfoList);
	            model.addAttribute("remainingDaysList", calculateRemainingDays(buyInfoList));
	        } else {
	            // 해당 ID를 가진 데이터가 없을 경우 처리
	            // 예: 오류 메시지 추가
	            model.addAttribute("error", "No BuyInfo found for user ID: " + userId);
	        }

	        return "mypage_user";
	    }
	  private List<Long> calculateRemainingDays(List<MemDto> buyInfoList) {
		    List<Long> remainingDaysList = new ArrayList<>();

		    for (MemDto buyInfo : buyInfoList) {
		        LocalDate startDate = buyInfo.getStartdate();
		        LocalDate endDate = buyInfo.getEnddate();

		        // 날짜 차이 계산
		        long remainingDays = ChronoUnit.DAYS.between(LocalDate.now(), endDate);

		        remainingDaysList.add(remainingDays);
		    }

		    return remainingDaysList;
		}
	  @RequestMapping("/payment")
	    public String submitPurchase(
	            @RequestParam(name = "period", required = false, defaultValue = "0") int period,
	            @RequestParam(name = "GXtype", required = false, defaultValue = "") String GXtype,
	            @RequestParam(name = "lockernumber", required = false, defaultValue = "") String lockernumber,
	            @RequestParam(name = "uniform", required = false, defaultValue = "") String uniform,
	            @RequestParam(name = "PTcount", required = false, defaultValue = "0") int PTcount,@ModelAttribute("user") MemDto dto, Model model) {
	    	String userId = dto.getId();
	        // 현재 날짜
	        LocalDate startDate = LocalDate.now();

	        // 3개월 뒤의 날짜
	        LocalDate endDate = startDate.plusMonths(period);

	        purchaseService.savePurchase(userId, startDate, endDate, GXtype, lockernumber, uniform, PTcount);
	        model.addAttribute("purchaseSuccessMessage", "구매가 성공적으로 완료되었습니다!");
	        return "thymeleaf/purchaseSuccessPage";
	    }
	  @GetMapping("/mypage_pt")
		public String mypage_pt() {
			return "mypage_pt";
		}
	  @GetMapping("/delete")
		public String deleteform(String result, Model m) {
			m.addAttribute("result",result);
			return "deleteform";
		}
		@DeleteMapping("/delete")
		public String delete(String formpw, @ModelAttribute("user") MemDto dto, SessionStatus status) {
		
			int i = service.deleteMem(formpw, dto);
			if(i == 0) {
				return "redirect:/delete?result=false";
			}else {
				status.setComplete();
				return "redirect:/main";
			}
		}
}
