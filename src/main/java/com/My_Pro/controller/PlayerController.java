package com.My_Pro.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.MemberDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.PscrapDto;
import com.My_Pro.dto.TeamDto;
import com.My_Pro.service.PlayerService;

@Controller
public class PlayerController {

	@Autowired 
	private PlayerService plsvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/playerList") 
	public ModelAndView playerList() {
	System.out.println("선수정보 페이지로 이동");
	ModelAndView mav = new ModelAndView();
	ArrayList<HitterDto> hpList = plsvc.getHpList();
	ArrayList<PitcherDto> ppList = plsvc.getPpList();
	ArrayList<TeamDto> teamList = plsvc.getTeamList();
	
	mav.addObject("hpList", hpList);
	mav.addObject("ppList", ppList);
	mav.addObject("teamList", teamList);
	

	
	mav.setViewName("player/PlayerList");
		return mav;
		
		
	}
		
	@RequestMapping(value = "/hitterInfo")
	public ModelAndView hitterInfo(String hcode) {
		ModelAndView mav = new ModelAndView();
		System.out.println("상세보기할 타자 코드:" + hcode);
		HitterDto hpInfo = plsvc.hitterInfo(hcode);
		mav.addObject("hpInfo", hpInfo);
		mav.setViewName("player/HitterInfo");
		return mav;
	}
	
	@RequestMapping(value = "/pitcherInfo")
	public ModelAndView pitcherInfo(String pcode) {
		
		ModelAndView mav = new ModelAndView();
		System.out.println("상세보기할 투수 코드:" + pcode);
		PitcherDto ppInfo = plsvc.pitcherInfo(pcode);
		mav.addObject("ppInfo", ppInfo);
		mav.setViewName("player/PitcherInfo");
		return mav;
	}
	
	// 스크랩 요청
	@RequestMapping(value = "/scrapHname")
	public @ResponseBody String scrapHname(String checkedName) {
		System.out.println("타자 스크랩 요청");
		System.out.println(checkedName);
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String hscid = loginInfo.getMid();
		HscrapDto scrapInfo = new HscrapDto();
		scrapInfo.setHscid(hscid);
		scrapInfo.setHschno(checkedName);
		plsvc.insertScrap(scrapInfo);

		return null;
	}
	
	@RequestMapping(value = "/scrapPname")
	public @ResponseBody String scrapPname(String checkedName) {
		System.out.println("투수 스크랩 요청");
		System.out.println(checkedName);
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String pscid = loginInfo.getMid();
		PscrapDto scrapInfo = new PscrapDto();
		scrapInfo.setPscid(pscid);
		scrapInfo.setPscpno(checkedName);
		plsvc.insertPscrap(scrapInfo);

		return null;
	}
	
	@RequestMapping(value = "/removeScrap")
	public @ResponseBody String removeScrap(String checkedName) {
		System.out.println("타자 스크랩 취소 요청");
		System.out.println(checkedName);
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String hscid = loginInfo.getMid();
		HscrapDto scrapInfo = new HscrapDto();
		scrapInfo.setHscid(hscid);
		scrapInfo.setHschno(checkedName);
		plsvc.deleteScrap(hscid, checkedName);

		return null;
	}
	
	@RequestMapping(value = "/removepScrap")
	public @ResponseBody String removepScrap(String checkedName) {
		System.out.println("투수 스크랩 취소 요청");
		System.out.println(checkedName);
		MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
		String pscid = loginInfo.getMid();
		PscrapDto scrapInfo = new PscrapDto();
		scrapInfo.setPscid(pscid);
		scrapInfo.setPscpno(checkedName);
		plsvc.deletepScrap(pscid, checkedName);

		return null;
	}
	
	
	@RequestMapping(value = "/selectScrap")
	public @ResponseBody String selectScrap() {
		if(session.getAttribute("loginInfo") != null) {
			
		System.out.println("스크랩 유무 확인");
				MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
				String hscid = loginInfo.getMid();
				String scrapInfo = plsvc.selectScrapInfo(hscid);
				
				return scrapInfo;
		}else {
			return null;
		}
	
	}
	
	@RequestMapping(value = "/selectpScrap")
	public @ResponseBody String selectpScrap() {
		if(session.getAttribute("loginInfo") != null) {
			
		System.out.println("스크랩 유무 확인");
				MemberDto loginInfo = (MemberDto) session.getAttribute("loginInfo");
				String pscid = loginInfo.getMid();
				String scrapInfo = plsvc.selectpScrapInfo(pscid);
				
				return scrapInfo;
		}else {
			return null;
		}
	
	}
	
}