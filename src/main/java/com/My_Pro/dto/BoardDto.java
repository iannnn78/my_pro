package com.My_Pro.dto;

import org.springframework.web.multipart.MultipartFile;

public class BoardDto {
	private int bno; //글번호
	private String bid;
	private String btitle; //글제목
	private String bcontents; //내용
	private String bdate; //글 작성 시간
	private String bcate; //카테고리
	private int bviews; //조회수
	private String bfilename;
	private String bstate;
	
	private MultipartFile bfile;

	
	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBstate() {
		return bstate;
	}

	public void setBstate(String bstate) {
		this.bstate = bstate;
	}


	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}




	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontents() {
		return bcontents;
	}

	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getBcate() {
		return bcate;
	}

	public void setBcate(String bcate) {
		this.bcate = bcate;
	}

	public int getBviews() {
		return bviews;
	}

	public void setBviews(int bviews) {
		this.bviews = bviews;
	}

	public String getBfilename() {
		return bfilename;
	}

	public void setBfilename(String bfilename) {
		this.bfilename = bfilename;
	}

	public MultipartFile getBfile() {
		return bfile;
	}

	public void setBfile(MultipartFile bfile) {
		this.bfile = bfile;
	}
	
	
}
