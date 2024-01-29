/*
 * package com.example.proj.controller;
 * 
 * import java.util.List;
 * 
 * import javax.servlet.http.HttpSession;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.ModelAttribute; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RestController; import
 * org.springframework.web.bind.annotation.SessionAttributes;
 * 
 * import com.example.proj.dao.BuyInfoMapper; import
 * com.example.proj.dto.BuyinfoDto; import com.example.proj.dto.MemDto;
 * 
 * import org.springframework.ui.Model;
 * 
 * @Controller
 * 
 * @SessionAttributes("user") // MemDto 클래스를 "user"라는 세션 속성으로 사용 public class
 * BuyInfoController {
 * 
 * @Autowired private BuyInfoMapper buyInfoMapper;
 * 
 * @RequestMapping("/mypage_user") public String
 * getBuyInfoBySessionId(@ModelAttribute("user") MemDto dto, Model model) { //
 * 세션에서 "user" 속성 가져오기 String userId = dto.getId();
 * 
 * // MyBatis를 통해 데이터베이스에서 데이터 가져오기 List<BuyinfoDto> buyInfoList =
 * buyInfoMapper.getBuyInfoByMemberId(userId);
 * 
 * // 모델에 데이터 추가 model.addAttribute("buyInfoList", buyInfoList);
 * 
 * // Thymeleaf 템플릿의 경로 반환 return "mypage_user"; } }
 * 
 */