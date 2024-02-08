package com.My_Pro.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.PscrapDto;
import com.My_Pro.dto.TeamDto;

public interface PlayerDao {

	@Select("SELECT HCODE, HPOS, HMONEY, HBIRTH, HBODY, HNO, HNAME, HTEAM, HAVG, HGAME, HHIT, HHR, HRBI, HIMG, HRANK FROM HITTER")
	ArrayList<HitterDto> getHpList();
	
	@Select("SELECT PCODE, PPOS, PMONEY, PBIRTH, PBODY, PNO, PNAME, PTEAM, PERA, PGAME, PWIN, PLOSE, PIP, PIMG, PRANK FROM PITCHER")
	ArrayList<PitcherDto> getPpList();
	
	@Select("SELECT TRANK, TTEAM, TWIN, TTIE, TLOSE, TODDS FROM TEAM")
	ArrayList<TeamDto> getTeamList();

	@Select("SELECT * FROM HITTER WHERE HCODE = #{hcode} ")
	HitterDto hitterInfo(String hcode);

	@Select("SELECT * FROM PITCHER WHERE PCODE = #{pcode} ")
	PitcherDto pitcherInfo(String pcode);
	
	@Select("SELECT MAX(HSCCODE) FROM HSCRAP ")
	String selectMaxSpnum();
	
	@Insert("INSERT INTO HSCRAP VALUES(#{hsccode},#{hscid},#{hschno},'0') ")
	int insertScrap(HscrapDto scrapInfo);

	@Delete("DELETE HSCRAP WHERE HSCID = #{hscid} AND HSCHNO = #{hschno}")
	int deleteScrap(@Param("hscid") String hscid, @Param("hschno") String hschno);

	@Select("SELECT * FROM HSCRAP WHERE HSCID = #{hscid} ")
	ArrayList<HscrapDto> selectScrapInfo(String hscid);

	@Select("SELECT * FROM HITTER WHERE HCODE = #{htnum}  ")
	HitterDto viewHtInfo(String htnum);
	
	@Select("SELECT MAX(PSCCODE) FROM PSCRAP ")
	String selectMaxPspnum();
	
	@Insert("INSERT INTO PSCRAP VALUES(#{psccode},#{pscid},#{pscpno},'0') ")
	int insertPscrap(PscrapDto scrapInfo);
	
	@Delete("DELETE PSCRAP WHERE PSCID = #{pscid} AND PSHPNO = #{pscpno}")
	int deletepScrap(String pscid, String checkedName);

	@Select("SELECT * FROM PSCRAP WHERE PSCID = #{pscid} ")
	ArrayList<PscrapDto> selectpScrapInfo(String pscid);

	@Select("SELECT * FROM PITCHER WHERE PCODE = #{ptnum}  ")
	PitcherDto viewPtInfo(String ptnum);

}
