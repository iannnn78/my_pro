package com.My_Pro.dto;

public class ReserveDto {

	private String recode;
	private String reid;
	private String reprcode;
	private String retitle;
	private String redate;
	private int remoney;
	private String readdr;
	
	
	
	public String getReaddr() {
		return readdr;
	}
	public void setReaddr(String readdr) {
		this.readdr = readdr;
	}
	
	public String getRecode() {
		return recode;
	}
	public void setRecode(String recode) {
		this.recode = recode;
	}
	public String getReid() {
		return reid;
	}
	public void setReid(String reid) {
		this.reid = reid;
	}
	public String getReprcode() {
		return reprcode;
	}
	public void setReprcode(String reprcode) {
		this.reprcode = reprcode;
	}
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	public int getRemoney() {
		return remoney;
	}
	public void setRemoney(int remoney) {
		this.remoney = remoney;
	}
	public String getRetitle() {
		return retitle;
	}
	public void setRetitle(String retitle) {
		this.retitle = retitle;
	}
	@Override
	public String toString() {
		return "ReserveDto [recode=" + recode + ", reid=" + reid + ", reprcode=" + reprcode + ", retitle=" + retitle
				+ ", redate=" + redate + ", remoney=" + remoney + "]";
	}

	
	
	
}
