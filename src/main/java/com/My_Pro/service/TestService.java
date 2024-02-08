package com.My_Pro.service;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.My_Pro.dao.PlayerDao;
import com.My_Pro.dao.TestDao;
import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.PitcherDto;
import com.My_Pro.dto.TeamDto;

@Service
public class TestService {
	
	@Autowired
	private TestDao tdao;
	
	@Autowired
	private PlayerDao pdao;
	
	public int player1() throws Exception {
				
		System.out.println("테스트 시작");
		//1.URL
		String ballUrl = "https://www.koreabaseball.com/Record/Player/HitterBasic/Basic1.aspx?sort=HRA_RT";
		//Jsoup
		Document doc = Jsoup.connect(ballUrl).get();
		
		Elements charDiv = doc.select("#cphContents_cphContents_cphContents_udpContent > div.record_result > table > tbody");
		Elements BallLi = charDiv.select("tr");
		
		int insertResult = 0;
		System.out.println(BallLi.size());
for(int i = 0; i < BallLi.size(); i++) {
	//상세페이지로 URL
	String detailURL = "https://www.koreabaseball.com"+ BallLi.eq(i).select("td:nth-child(2) > a").eq(0).attr("href");
	System.out.println(detailURL);
	//상세페이지 도커먼트
	Document detailDoc = Jsoup.connect(detailURL).get();
	//상세정보 ul > li:nth-child(10) ul > li:nth-child(3) > strong
	Elements basePlayer = detailDoc.select("#contents > div.sub-content > div.player_info > div.player_basic");
	
	//포지션 
	String hpos = basePlayer.select("ul > li:nth-child(4) > span").text();
	//연봉 
	String hmoney = basePlayer.select("ul > li:nth-child(8) > span").text();
	//출생
	String hbirth = basePlayer.select("ul > li:nth-child(3) > span").text();
	//신체
	String hbody = basePlayer.select("ul > li:nth-child(5) > span").text();
	//등번호
	String hno = basePlayer.select("ul > li:nth-child(2) > span").text();
	//선수명
	String hname = BallLi.eq(i).select("td:nth-child(2) > a").text();
	//소속팀
	String hteam = BallLi.eq(i).select("td:nth-child(3)").text();
	//타율
	String havg = BallLi.eq(i).select("td:nth-child(4)").text();
	//경기수
	String hgame = BallLi.eq(i).select("td:nth-child(5)").text();
	//안타
	String hhit = BallLi.eq(i).select("td:nth-child(9)").text();
	//홈런
	String hhr = BallLi.eq(i).select("td:nth-child(12)").text();
	//타점
	String hrbi = BallLi.eq(i).select("td:nth-child(14)").text();
	//이미지 
	String himg = basePlayer.select("div.photo > img").attr("abs:src");
	
	
System.out.println("선수명: " + hname);
System.out.println("팀: " + hteam);	
System.out.println("타율: " + havg);	
System.out.println("경기수: " + hgame);	
System.out.println("안타: " + hhit);	
System.out.println("홈런: " + hhr);	
System.out.println("타점: " + hrbi);	
System.out.println("포지션 : " + hpos);
System.out.println("연봉: " + hmoney);	
System.out.println("출생: " + hbirth);	
System.out.println("키/몸무게: " + hbody);	
System.out.println("등번호: " + hno);	
System.out.println("이미지: " + himg);	

//Dto에 넣어주자
HitterDto hitter = new HitterDto();
hitter.setHavg(havg);
hitter.setHbirth(hbirth);
hitter.setHbody(hbody);
hitter.setHgame(hgame);
hitter.setHhit(hhit);
hitter.setHhr(hhr);
hitter.setHmoney(hmoney);
hitter.setHname(hname);
hitter.setHno(hno);
hitter.setHpos(hpos);
hitter.setHrbi(hrbi);
hitter.setHteam(hteam);
hitter.setHimg(himg);

////선수 코드 만들기
String maxHpcode = tdao.selectMaxHpnum();
System.out.println("공고코드 최대값 : " + maxHpcode);
String hpcode = "HP";
if (maxHpcode == null) {
	hpcode = hpcode + String.format("%03d", 1);
} else {
	int hpcodeNum = Integer.parseInt(maxHpcode.replace("HP", "")) + 1;
	hpcode = hpcode + String.format("%03d", hpcodeNum);
}
System.out.println("타자코드 : " + hpcode);

hitter.setHcode(hpcode);

insertResult += tdao.insertHitter(hitter);

System.out.println("등록된 타자 수 : " + insertResult);

}
		
		return insertResult;
		
	}

	
	public int player2() throws Exception {
		
		//URL
		String ballUrl = "https://www.koreabaseball.com/Record/Player/PitcherBasic/Basic1.aspx";
		Document doc = Jsoup.connect(ballUrl).get();
		
		Elements charDiv = doc.select("#cphContents_cphContents_cphContents_udpContent > div.record_result > table > tbody");
		Elements BallLi = charDiv.select("tr");
		
		int insertResult = 0;
		System.out.println(BallLi.size());
for(int i = 0; i < BallLi.size(); i++) {
	//상세페이지로 가기 위해 URL 추출
	String detailURL = "https://www.koreabaseball.com"+ BallLi.eq(i).select("td:nth-child(2) > a").eq(0).attr("href");
	System.out.println(detailURL);
	//상세페이지 도커먼트
	Document detailDoc = Jsoup.connect(detailURL).get();
	//상세정보 
	Elements basePlayer = detailDoc.select("#contents > div.sub-content > div.player_info > div.player_basic");
	//선수명
	String pname = BallLi.eq(i).select("td:nth-child(2) > a").text();
	System.out.println("선수명:" + pname);
	//소속팀
	String pteam = BallLi.eq(i).select("td:nth-child(3)").text();
	System.out.println("소속팀:" + pteam);
	//ERA
	String pera = BallLi.eq(i).select("td:nth-child(4)").text();
	System.out.println("방어율:" + pera);
	//경기수
	String pgame = BallLi.eq(i).select("td:nth-child(5)").text();
	System.out.println("경기수:" + pgame);
	//승
	String pwin = BallLi.eq(i).select("td:nth-child(6)").text();
	System.out.println("승:" + pwin);
	//패
	String plose= BallLi.eq(i).select("td:nth-child(7)").text();
	System.out.println("패:" + plose);
	//이닝
	String pip = BallLi.eq(i).select("td:nth-child(11)").text();
	System.out.println("이닝:" + pip);
	
	//생년월일
	String pbirth = basePlayer.select("ul > li:nth-child(3) >span").text();
	System.out.println("생년월일 :" + pbirth);
	//키/몸무게
	String pbody = basePlayer.select("ul > li:nth-child(5) >span").text();
	System.out.println("키/몸무게 :" + pbody);
	//연봉
	String pmoney = basePlayer.select("ul > li:nth-child(8) >span").text();
	System.out.println("연봉 :" + pmoney);
	//등번호
	String pno = basePlayer.select("ul > li:nth-child(2) >span").text();
	System.out.println("등번호 :" + pno);
	//포지션
	String ppos = basePlayer.select("ul > li:nth-child(4) >span").text();
	System.out.println("포지션 :" + ppos);
	//이미지
	String pimg = basePlayer.select("div.photo > img").attr("abs:src");
	System.out.println("이미지 :" + pimg);
	
	//Dto에 넣어주자
	PitcherDto pitcher = new PitcherDto();
	pitcher.setPlose(plose);
	pitcher.setPbirth(pbirth);
	pitcher.setPbody(pbody);
	pitcher.setPera(pera);
	pitcher.setPgame(pgame);
	pitcher.setPip(pip);
	pitcher.setPmoney(pmoney);
	pitcher.setPname(pname);
	pitcher.setPno(pno);
	pitcher.setPpos(ppos);
	pitcher.setPteam(pteam);
	pitcher.setPteam(pteam);
	pitcher.setPwin(pwin);
	pitcher.setPimg(pimg);

		
	//선수 코드 만들기
	String maxPpcode = tdao.selectMaxPpnum();
	System.out.println("투수코드 최대값 : " + maxPpcode);
	String ppcode = "PP";
	if (maxPpcode == null) {
		ppcode = ppcode + String.format("%03d", 1);
	} else {
		int ppcodeNum = Integer.parseInt(maxPpcode.replace("PP", "")) + 1;
		ppcode = ppcode + String.format("%03d", ppcodeNum);
	}
	System.out.println("투수코드 : " + ppcode);
	
	pitcher.setPcode(ppcode);
	
	insertResult += tdao.insertPitcher(pitcher);

	System.out.println("등록된 투수 수 : " + insertResult);

}

		
		return insertResult;
	}
	
	public int team1() throws Exception {
		//URL
		String ballUrl = "https://www.koreabaseball.com/Record/TeamRank/TeamRank.aspx";
		Document doc = Jsoup.connect(ballUrl).get();
		
		Elements charDiv = doc.select("#cphContents_cphContents_cphContents_udpRecord > table > tbody");
		Elements BallLi = charDiv.select("tr");
		
		int insertResult = 0;
		
		for (int i = 0; i < BallLi.size(); i++) {
			//순위
			String trank = BallLi.eq(i).select("td:nth-child(1)").text();
			System.out.println("순위: " + trank);
			//팀명
			String tteam = BallLi.eq(i).select("td:nth-child(2)").text();
			System.out.println("팀명: " + tteam);
			//승
			String twin = BallLi.eq(i).select("td:nth-child(4)").text();
			System.out.println("승: " + twin);
			//무승부
			String ttie = BallLi.eq(i).select("td:nth-child(6)").text();
			System.out.println("무: " + ttie);
			//패
			String tlose = BallLi.eq(i).select("td:nth-child(5)").text();
			System.out.println("패: " + tlose);
			//승률
			String todds = BallLi.eq(i).select("td:nth-child(7)").text();
			System.out.println("승률: " + todds);
			
			//DTO 넣기
			TeamDto team = new TeamDto();
			team.setTodds(todds);
			team.setTlose(tlose);
			team.setTrank(trank);
			team.setTteam(tteam);
			team.setTtie(ttie);
			team.setTwin(twin);
			
			insertResult += tdao.insertTeam(team);
		}
		
		
		return insertResult;
		
	}


	public ArrayList<HitterDto> selecttopHp() {
	System.out.println("TOP스크랩 서비스");
	ArrayList<HscrapDto> hpTOPsc = tdao.selectTopHp();
	ArrayList<HitterDto> htInfo = new ArrayList<HitterDto>();
	for (int i = 0; i < hpTOPsc.size(); i++) {
		String htnum = hpTOPsc.get(i).getHschno();
	 HitterDto hitter = pdao.viewHtInfo(htnum);
		htInfo.add(hitter);
	}
		return htInfo;
	}


	public ArrayList<BoardDto> selectBoardHit() {
		System.out.println("인기글 서비스");
		ArrayList<BoardDto> boardHit = tdao.selectBoardHit();
		return boardHit;
	}
}
