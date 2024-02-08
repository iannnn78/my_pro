package com.My_Pro.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.My_Pro.dao.MemberDao;
import com.My_Pro.dao.PlayerDao;
import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.MemberDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.ProductDto;
import com.My_Pro.dto.PscrapDto;
import com.My_Pro.dto.ReserveDto;


@Service
public class MemberService {

	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private PlayerDao pdao;
	
	public int insertMemberJoin(MemberDto member) {
		System.out.println("SERVICE-회원가입");
		int insertResult = mdao.insertMember(member);
		return insertResult;
	}

	public MemberDto memberLogin(String inputMid, String inputMpw) {
		System.out.println("SERVICE-로그인");
		MemberDto loginInfo = mdao.Loginlogn(inputMid,inputMpw);
		System.out.println(loginInfo);
		return loginInfo;
	}

	public String updateInfo(String id, String pw, String name, String addr) {
		System.out.println("Service-updateInfo 호출");
		String result = "";

			System.out.println("개인회원 정보 수정");
			int updateResult = mdao.updateInfo(id, pw, name, addr);
			if (updateResult == 1) {
				result = "OK";
			} else {
				result = "NO";
			}
			return result;
		} 
	

	public ArrayList<BoardDto> selectMyBoard(String loginId) {
System.out.println("SERVICE-회원정보 글 작성 내용 가져오기");
	ArrayList<BoardDto> myboard = mdao.selectMyBoard(loginId);
		return myboard;
	}

	public ArrayList<HitterDto> selectMyHitter(String loginId) {
		System.out.println("SERVICE-회원정보 타자 스크랩 내용 가져오기");
		ArrayList<HscrapDto> myScrap = mdao.selectMyHitter(loginId);
		ArrayList<HitterDto> htInfo = new ArrayList<HitterDto>();
		for (int i = 0; i < myScrap.size(); i++) {
			String htnum = myScrap.get(i).getHschno();
		 HitterDto hitter = pdao.viewHtInfo(htnum);
			htInfo.add(hitter);
		}
		return htInfo;
	}
	public ArrayList<PitcherDto> selectMyPitcher(String loginId) {
		System.out.println("SERVICE-회원정보 타자 스크랩 내용 가져오기");
		ArrayList<PscrapDto> myScrap = mdao.selectMyPitcher(loginId);
		ArrayList<PitcherDto> ptInfo = new ArrayList<PitcherDto>();
		for (int i = 0; i < myScrap.size(); i++) {
			String ptnum = myScrap.get(i).getPscpno();
		 PitcherDto pitcher = pdao.viewPtInfo(ptnum);
			ptInfo.add(pitcher);
		}
		return ptInfo;
	}

	public ArrayList<ReserveDto> selctMyReserve(String loginId) {
		System.out.println("SERVICE-회원정보 거래 내용 가져오기");
		ArrayList<ReserveDto> myreserve = mdao.selctMyReserve(loginId);
			return myreserve;
	}

	public String checkMId(String mid) {
		System.out.println("개인회원 아이디 조회");
		String checkIdResult = "";
		checkIdResult = mdao.selectMCheckId(mid);
		return checkIdResult;
	
	}

	public boolean deleteUserInfo(String loginId) {
		System.out.println("Service-deleteUserInfo() 호출");
		boolean result = false;
		int updateResult = 0;
		
			updateResult = mdao.updateState(loginId);
		
		if (updateResult == 1) {
			result = true;
		}
		return result;
	}

	public String checkPw(String loginId, String currentPw) {
		String result = "NO";
	
			String loginPw = mdao.selectMemberPw(loginId);
			if (loginPw.equals(currentPw)) {
				result = "OK";
			}
		
		return result;
	}

	public ArrayList<ProductDto> selctMyProYes(String loginId) {
		System.out.println("SERVICE-회원정보 판매완료 내용 가져오기");
		ArrayList<ProductDto> myproy = mdao.selctMyProYes(loginId);
			return myproy;
	}

	public ArrayList<ProductDto> selctMyProNo(String loginId) {
		System.out.println("SERVICE-회원정보 판매중 내용 가져오기");
		ArrayList<ProductDto> mypron = mdao.selctMyProNo(loginId);
			return mypron;
	}


}
