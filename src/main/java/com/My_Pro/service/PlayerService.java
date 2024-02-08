package com.My_Pro.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.My_Pro.dao.PlayerDao;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.PscrapDto;
import com.My_Pro.dto.TeamDto;
import com.google.gson.Gson;

@Service
public class PlayerService {
	@Autowired
	private PlayerDao pldao;
	
	public ArrayList<HitterDto> getHpList() {
		System.out.println("SERVICE-타자정보 가져오기");
		ArrayList<HitterDto> hpList = pldao.getHpList();
		
		return hpList;
	}

	public ArrayList<PitcherDto> getPpList() {
		System.out.println("SERVICE-투수정보 가져오기");
		ArrayList<PitcherDto> ppList = pldao.getPpList();
		return ppList;
	}

	public ArrayList<TeamDto> getTeamList() {
		System.out.println("SERVICE-팀 정보 가져오기");
		ArrayList<TeamDto> teamList = pldao.getTeamList();
		return teamList;
	}

	public HitterDto hitterInfo(String hcode) {
		System.out.println("SERVICE- 타자 상세보기");
		HitterDto hpinfo = pldao.hitterInfo(hcode);
		return hpinfo;
	}

	public PitcherDto pitcherInfo(String pcode) {
		System.out.println("SERVICE- 투수 상세보기");
		PitcherDto ppinfo = pldao.pitcherInfo(pcode);
		return ppinfo;
	}

	public int insertScrap(HscrapDto scrapInfo) {
		System.out.println("epsvc insertScrap요청");
		String maxHscode = pldao.selectMaxSpnum();
		System.out.println("스크랩 번호 최대값 : " + maxHscode);
		String hsccode = "SH";
		if (maxHscode == null) {
			hsccode = hsccode + String.format("%03d", 1);
			System.out.println("처음 스크랩코드 : " + hsccode);
		} else {
			int spcodeNum = Integer.parseInt(maxHscode.replace("SH", "")) + 1;
			hsccode = hsccode + String.format("%03d", spcodeNum);
		}
		System.out.println("스크랩코드 : " + hsccode);
		scrapInfo.setHsccode(hsccode);
		int insertResult = pldao.insertScrap(scrapInfo);
		return insertResult;
		
	}

	public int deleteScrap(String hscid, String checkedName) {
		System.out.println("SERVICE- 스크랩 취소 요청");
		int deleteResult = pldao.deleteScrap(hscid, checkedName);
		return deleteResult;
	}

	public String selectScrapInfo(String hscid) {
		ArrayList<HscrapDto> spList = pldao.selectScrapInfo(hscid);
		return new Gson().toJson(spList);
	}

	public int insertPscrap(PscrapDto scrapInfo) {
		System.out.println("epsvc insertScrap요청");
		String maxPscode = pldao.selectMaxPspnum();
		System.out.println("스크랩 번호 최대값 : " + maxPscode);
		String psccode = "SP";
		if (maxPscode == null) {
			psccode = psccode + String.format("%03d", 1);
			System.out.println("처음 스크랩코드 : " + psccode);
		} else {
			int spcodeNum = Integer.parseInt(maxPscode.replace("SP", "")) + 1;
			psccode = psccode + String.format("%03d", spcodeNum);
		}
		System.out.println("스크랩코드 : " + psccode);
		scrapInfo.setPsccode(psccode);
		int insertResult = pldao.insertPscrap(scrapInfo);
		return insertResult;
		
	}

	public int deletepScrap(String pscid, String checkedName) {
		System.out.println("SERVICE- 스크랩 취소 요청");
		int deleteResult = pldao.deletepScrap(pscid, checkedName);
		return deleteResult;
		
	}

	public String selectpScrapInfo(String pscid) {
		ArrayList<PscrapDto> shList = pldao.selectpScrapInfo(pscid);
		return new Gson().toJson(shList);	
	}

}
