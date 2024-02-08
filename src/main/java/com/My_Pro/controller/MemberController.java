package com.My_Pro.controller;

import java.lang.reflect.Member;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.My_Pro.dao.PlayerDao;
import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.MemberDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.ProductDto;
import com.My_Pro.dto.ReserveDto;
import com.My_Pro.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService msvc;
	
	
	@Autowired
	private HttpSession session;
	
	//소개 사이트
	@RequestMapping(value = "/service")
	public ModelAndView service() {
		System.out.println("소개 사이트 페이지로 이동");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Service");
		return mav;
		
	}
	
	// 회원 탈퇴
	@RequestMapping(value = "/deleteUserInfo")
	public @ResponseBody boolean deleteUserInfo() {
		System.out.println("deleteUserInfo 호출");
		boolean result = false;
		
		String loginId = (String)session.getAttribute("loginId");
		result = msvc.deleteUserInfo(loginId);
		return result;
	}
	
	// 회원탈퇴 유저
		@RequestMapping(value = "/deleteUser")
		public String deleteUser() {
			System.out.println("회원탈퇴 페이지 요청");
			return "member/DeleteUser";
		}
	
	
	// 로그인 회원 비밀번호 확인
	@RequestMapping(value = "/checkPassword")
	public @ResponseBody String checkPassword(String currentPw) {
		System.out.println("currentPw: " + currentPw);
		String loginId = (String)session.getAttribute("loginId");
	
		String result = msvc.checkPw(loginId, currentPw);
		return result;
	}
	
	@RequestMapping(value = "/joinMIdCheck")
	public @ResponseBody String joinMIdCheck(String mid) {
		System.out.println("ID 중복확인 요청");
		System.out.println("입력한 아이디: " + mid);
		String result = "OK";
		String checkId = msvc.checkMId(mid);
		System.out.println(checkId);
		if (checkId != null) {
			result = "NO";
		}
		return result;
	}
	
	
	@RequestMapping (value = "/memberInfo")
	public ModelAndView meberInfo() {
		System.out.println("멤버정보 페이지로 이동");
	ModelAndView mav = new ModelAndView();
	String loginId = (String)session.getAttribute("loginId");
	System.out.println(loginId);
	ArrayList<BoardDto> myborad = msvc.selectMyBoard(loginId);
	ArrayList<HitterDto> myhitter = msvc.selectMyHitter(loginId);	
	ArrayList<PitcherDto> mypitcher = msvc.selectMyPitcher(loginId);
	ArrayList<ReserveDto> myreserve = msvc.selctMyReserve(loginId);
	ArrayList<ProductDto> myproy = msvc.selctMyProYes(loginId);
	ArrayList<ProductDto> mypron = msvc.selctMyProNo(loginId);
	
	mav.addObject("myhitter", myhitter);
	mav.addObject("mypitcher", mypitcher);
	mav.addObject("myreserve", myreserve);
	mav.addObject("myboard", myborad);
	mav.addObject("myproy", myproy);
	mav.addObject("mypron", mypron);
	mav.setViewName("member/MemberInfo");
	return mav;
	}
	
	
	
	@RequestMapping (value = "/updateInfo")
	public @ResponseBody String updateInfo (String id, String pw, String name, String addr) {
		
		System.out.println("id : " + id);
		String result = msvc.updateInfo(id, pw, name, addr);
		session.invalidate();
		return result;
		
		
		
	}
	
	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		
		ra.addFlashAttribute("redirectMsg","로그아웃 되었습니다");
		mav.setViewName("redirect:/");	
		return mav;
	}
	
	@RequestMapping(value = "/memberLoginForm")
	public ModelAndView memberLogin() {
		System.out.println("로그인 페이지로 이동 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberLogin");
		return mav;
	}
	

	
	@RequestMapping(value = "/memberJoinForm")
	public ModelAndView memberJoin() {
		System.out.println("회원가입 페이지로 이동 요청");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberJoin");
		return mav;
	}
	
	
	@RequestMapping (value = "/memberLogin")
	public ModelAndView memberLogin(String loginT, String inputMid, String inputMpw) {
		System.out.println("로그인 요청");
		ModelAndView mav = new ModelAndView();

		
		System.out.println("입력한 아이디 : " + inputMid);
		System.out.println("입력한 비밀번호 : " + inputMpw);
	
		MemberDto loginInfo = msvc.memberLogin(inputMid, inputMpw);
		if(loginInfo == null) { // 조회되는 회원정보가 없을 경우
			System.out.println("로그인 실패");
			
			// 로그인 페이지 이동
			mav.setViewName("redirect:/memberLoginForm");
			
		} else { 
			System.out.println("로그인 성공");
		
			session.setAttribute("loginInfo", loginInfo);
			session.setAttribute("loginId", loginInfo.getMid());
			session.setAttribute("loginAddr", loginInfo.getMaddr());	
		
			//2. 메인페이지 이동
			mav.setViewName("redirect:/");
		}
		return mav;
	
		
	}
	
	
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member){
		System.out.println("회원가입 요청");
		ModelAndView mav = new ModelAndView();
		int JoinResult = msvc.insertMemberJoin(member);
		
		if(JoinResult > 0) {
			System.out.println("회원가입 성공쓰");
			mav.setViewName("redirect:/");
		}else {
			System.out.println("회원가입 실패!");
			mav.setViewName("member/MemberJoinForm");
		}
		return mav;
		
	}
	
	
}
