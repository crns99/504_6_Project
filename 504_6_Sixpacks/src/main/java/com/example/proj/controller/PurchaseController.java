package com.example.proj.controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import com.example.proj.service.PurchaseService;
import com.example.proj.dto.MemDto;
@Controller
@SessionAttributes("user")
public class PurchaseController {
	 @Autowired
	    private PurchaseService purchaseService;
	@RequestMapping("/buy_membership") public String purchasePage(Model model, MemDto dto) { 
		
		model.addAttribute("randomNumber", Math.floorMod((int) (Math.floor(Math.random() * 36) + 1), 36));

		
		return
			  "thymeleaf/buy_membership"; }

			/*
			 * @PostMapping("/payment") public ModelAndView
			 * processPayment(@RequestParam(name = "options") String options) { ModelAndView
			 * modelAndView = new ModelAndView("thymeleaf/payment");
			 * modelAndView.addObject("options", options); return modelAndView; }
			 */

			/*
			 * @PostMapping("/payment") public String submitPurchase(
			 * 
			 * @RequestParam(name = "period", required = false, defaultValue = "0") int
			 * period,
			 * 
			 * @RequestParam(name = "GXtype", required = false, defaultValue = "") String
			 * GXtype,
			 * 
			 * @RequestParam(name = "lockernumber", required = false, defaultValue = "")
			 * String lockernumber,
			 * 
			 * @RequestParam(name = "uniform", required = false, defaultValue = "") String
			 * uniform,
			 * 
			 * @RequestParam(name = "PTcount", required = false, defaultValue = "0") int
			 * PTcount,Model model, MemDto dto) { String userId = dto.getId();
			 * System.out.println("@@@@@@@@@@@Q@#Q@#id:"+userId); // 현재 날짜 LocalDate
			 * startDate = LocalDate.now();
			 * 
			 * // 3개월 뒤의 날짜 LocalDate endDate = startDate.plusMonths(period);
			 * 
			 * purchaseService.savePurchase(userId, startDate, endDate, GXtype,
			 * lockernumber, uniform, PTcount);
			 * 
			 * return "구매 성공!"; }
			 */
}
