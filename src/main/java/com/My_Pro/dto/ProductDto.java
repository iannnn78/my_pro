package com.My_Pro.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductDto {

	private String prcode;
	private String prid;
	private String prtitle;
	private String prcontents;
	private String prmoney;
	private String prfilename;
	private String prdate;
	private String prstate;
	private MultipartFile prfile;
	
	
	
	public String getPrdate() {
		return prdate;
	}
	public void setPrdate(String prdate) {
		this.prdate = prdate;
	}
	public String getPrstate() {
		return prstate;
	}
	public void setPrstate(String prstate) {
		this.prstate = prstate;
	}
	public String getPrcode() {
		return prcode;
	}
	public void setPrcode(String prcode) {
		this.prcode = prcode;
	}
	public String getPrid() {
		return prid;
	}
	public void setPrid(String prid) {
		this.prid = prid;
	}
	public String getPrtitle() {
		return prtitle;
	}
	public void setPrtitle(String prtitle) {
		this.prtitle = prtitle;
	}
	public String getPrcontents() {
		return prcontents;
	}
	public void setPrcontents(String prcontents) {
		this.prcontents = prcontents;
	}
	public String getPrmoney() {
		return prmoney;
	}
	public void setPrmoney(String prmoney) {
		this.prmoney = prmoney;
	}
	public String getPrfilename() {
		return prfilename;
	}
	public void setPrfilename(String prfilename) {
		this.prfilename = prfilename;
	}
	public MultipartFile getPrfile() {
		return prfile;
	}
	public void setPrfile(MultipartFile prfile) {
		this.prfile = prfile;
	}
	
	

	
}
