package com.My_Pro.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.My_Pro.dto.ProductDto;
import com.My_Pro.dto.PscrapDto;
import com.My_Pro.dto.ReplyDto;
import com.My_Pro.dto.ReserveDto;
import com.My_Pro.service.MarketService;

@Controller
public class MarketController {

	@Autowired
	private MarketService mksvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/marketList")
	public ModelAndView marketList() {
		System.out.println("중고거래 페이지로 이동");
		ModelAndView mav = new ModelAndView();
		
		ArrayList<ProductDto> pdList = mksvc.selectpdList();
		
		mav.addObject("pdList", pdList);
		mav.setViewName("market/MarketList");
		return mav;
	}
	
	
	@RequestMapping(value = "/productWritePage")
	public ModelAndView productWritePage() {
		System.out.println("상품등록페이지로");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("market/ProductWrite");
		return mav;
	}
	
	@RequestMapping(value = "/productWrite")
	public ModelAndView productWrite(ProductDto product) throws IllegalStateException, IOException {
		System.out.println("상품등록");
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("loginId") == null ) {
			System.out.println("로그인 하지 않음");
			mav.setViewName("redirect:/memberLoginForm");
		}
		String loginId = (String)session.getAttribute("loginId");
		product.setPrid(loginId);
		
		int writeResult = mksvc.insertproduct(product);
		if (writeResult > 0) {
			mav.setViewName("market/MarketList");
		}else {
			
			mav.setViewName("market/ProductWrite");
		}
		
		
		
		return mav;
	}
	
	
	@RequestMapping(value = "/productView")
	public ModelAndView productView(String viewPrcode) {
		System.out.println("상품정보 상세보기");
		ModelAndView mav = new ModelAndView();
		System.out.println("상세보기할 상품 번호: " + viewPrcode);
		ProductDto product = mksvc.selectPdView(viewPrcode); 
		System.out.println(product);
		mav.addObject("product",product);
		
		mav.setViewName("market/ProductView");
		return mav;
	}
	
	
	@RequestMapping(value = "/reservePro_payReady")
	public @ResponseBody String reservePro_payReady(ReserveDto reInfo, String checkedName) throws Exception {
		
		System.out.println("ajax_물품 결제 준비");
		reInfo.setReprcode(checkedName);
		System.out.println("checkedName" + checkedName);
		String proUrl = mksvc.reservePro_payReady(reInfo, session, checkedName);
		return proUrl;
		
		
	}
	

	@RequestMapping(value = "/reservePro_PayApproval")
	public ModelAndView reservePro_PayApproval(String pg_token, String recode ) throws Exception {
		System.out.println("ajax_결제승인 요청");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("pg_token : " + pg_token);
		String tid = (String)session.getAttribute("payTid");
	
		String testCode = (String)session.getAttribute("testCode");
		
		System.out.println("코드:" + testCode);
		
		System.out.println("tid : " + tid);
		
		String reserveResult = mksvc.reservePro_PayApproval(tid, pg_token, recode, session);
		
		int updatePro = mksvc.updatePro(testCode);
		
		session.removeAttribute("payTid");
		session.removeAttribute("testCode");
		
		
		mav.addObject("reserveResult", reserveResult);
		mav.setViewName("market/pay_App");
		
		return mav;
	}
	
	@RequestMapping(value = "/reservePro_PayCancel")
	public ModelAndView reservePro_PayCancel(String recode) throws Exception {
		System.out.println("ajax_결제취소");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("payTid");
		int deleteReserve = mksvc.deleteReserveInfo(recode);
		mav.addObject("reserveResult", "cencel");
		mav.setViewName("market/pay_Cancel");
		return mav;
	}	
	
	
	
	@RequestMapping(value = "/reservePro_PayFail")
	public ModelAndView reservePro_PayFail(String recode) throws Exception {
		System.out.println("ajax_결제실패");
		ModelAndView mav = new ModelAndView();
		int deleteReserve = mksvc.deleteReserveInfo(recode);
		session.removeAttribute("payTid");
		mav.addObject("reserveResult", "Fail");
		mav.setViewName("market/pay_Fail");
		return mav;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
