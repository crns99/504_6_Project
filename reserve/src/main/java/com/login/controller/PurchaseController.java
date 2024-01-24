package com.login.controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PurchaseController {
	@RequestMapping("/buy_membership") public String purchasePage() { return
			  "buy_membership"; }

    @PostMapping("/payment")
    public ModelAndView processPayment(@RequestParam(name = "options") String options) {
        ModelAndView modelAndView = new ModelAndView("payment");
        modelAndView.addObject("options", options);
        return modelAndView;
    }
}
