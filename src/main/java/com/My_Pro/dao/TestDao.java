package com.My_Pro.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.TeamDto;

public interface TestDao {

	
	@Select("SELECT MAX(HCODE) FROM HITTER")
	String selectMaxHpnum();

	@Insert("INSERT INTO HITTER(HCODE, HPOS, HMONEY, HBIRTH, HBODY, HNO, HNAME, HTEAM, HAVG, HGAME, HHIT, HHR, HRBI, HIMG ) "
			  + "VALUES(#{hcode}, #{hpos}, #{hmoney}, #{hbirth}, #{hbody}, #{hno}, #{hname}, #{hteam}, #{havg}, #{hgame}, #{hhit}, #{hhr}, #{hrbi}, #{himg} ) ")
	int insertHitter(HitterDto hitter);

	@Select("SELECT MAX(PCODE) FROM PITCHER")
	String selectMaxPpnum();
	
	@Insert("INSERT INTO PITCHER(PCODE, PPOS, PMONEY, PBIRTH, PBODY, PNO, PNAME, PTEAM, PERA, PGAME, PWIN, PLOSE, PIP, PIMG ) "
			  + "VALUES(#{pcode}, #{ppos}, #{pmoney}, #{pbirth}, #{pbody}, #{pno}, #{pname}, #{pteam}, #{pera}, #{pgame}, #{pwin}, #{plose}, #{pip}, #{pimg} ) ")
	int insertPitcher(PitcherDto pitcher);

	@Insert("INSERT INTO TEAM (TRANK, TTEAM, TWIN, TTIE, TLOSE, TODDS) "
			+ "VALUES(#{trank}, #{tteam}, #{twin}, #{ttie}, #{tlose}, #{todds})")
	int insertTeam(TeamDto team);

	@Select("SELECT HSCHNO FROM (SELECT HSCHNO, COUNT(*) FROM HSCRAP GROUP BY HSCHNO ORDER BY COUNT(*) DESC) WHERE ROWNUM <= 4 ")
	ArrayList<HscrapDto> selectTopHp();

	@Select("SELECT * FROM (SELECT * FROM BOARDS ORDER BY BVIEWS DESC) WHERE ROWNUM <= 3 ")
	ArrayList<BoardDto> selectBoardHit();
	
	



}
