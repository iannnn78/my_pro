package com.My_Pro.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.service.TestService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private TestService tesvc;
	

	@RequestMapping(value = "/")
	public ModelAndView home() {
		System.out.println("메인 홈페이지");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<HitterDto> hpList = tesvc.selecttopHp();
		ArrayList<BoardDto> boardHit = tesvc.selectBoardHit();
		mav.addObject("hpList", hpList);
		mav.addObject("boardHit", boardHit);
		mav.setViewName("Main");
		return mav;
	}
	
	@RequestMapping(value = "/player1")
	public ModelAndView player1() throws Exception {
		System.out.println("player1 테스트");
		int insertResult = tesvc.player1();
		System.out.println(insertResult);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Main");
		return mav;
	}
	
	@RequestMapping(value = "/player2")
	public ModelAndView player2() throws Exception {
		System.out.println("player2 테스트");
		int insertResult = tesvc.player2();
		System.out.println(insertResult);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Main");
		return mav;
	}
	
	@RequestMapping(value = "/team1")
	public ModelAndView team1() throws Exception {
		System.out.println("team1 테스트");
		int insertResult = tesvc.team1();
		System.out.println(insertResult);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Main");
		return mav;
	}
	
}
