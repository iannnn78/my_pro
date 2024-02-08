package com.My_Pro.service;


import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.My_Pro.dao.MarketDao;
import com.My_Pro.dto.ProductDto;
import com.My_Pro.dto.ReserveDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class MarketService {

	@Autowired
	private MarketDao mkdao;
	
	@Autowired
	private ServletContext context;
	
	public ArrayList<ProductDto> selectpdList() {
System.out.println("SERVICE-판매정보 가져오기");
ArrayList<ProductDto> pdList = mkdao.selectPdList();
		
		return pdList;
	}


	//제품등록
	public int insertproduct(ProductDto product) throws IllegalStateException, IOException {
		
		String maxPrcode = mkdao.selectMaxPrnum();
		System.out.println("제품 번호 최대값 : " + maxPrcode);
		String prcode = "PR";
		if (maxPrcode == null) {
			prcode = prcode + String.format("%03d", 1);
			System.out.println("처음 제품코드 : " + prcode);
		} else {
			int prcodeNum = Integer.parseInt(maxPrcode.replace("PR", "")) + 1;
			prcode = prcode + String.format("%03d", prcodeNum);
		}
		System.out.println("제품코드 : " + prcode);
		
		product.setPrcode(prcode);
		
		MultipartFile prfile = product.getPrfile();
		String prfilename = "";
		if(prfile != null && !prfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			prfilename = uuid.toString() + "_" + prfile.getOriginalFilename();
			String savePath = context.getRealPath("resources\\uploadProduct");
			File file = new File(savePath,prfilename);
			prfile.transferTo(file);
		}
		
		product.setPrfilename(prfilename);
		int insertResult = 0;
		try {
			insertResult = mkdao.insertProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return insertResult;
	}


	public ProductDto selectPdView(String viewPrcode) {
		System.out.println("service- 상품 상세보기");
		
		ProductDto product = mkdao.selectPdView(viewPrcode);
		return product;
	}


	public String reservePro_payReady(ReserveDto reInfo, HttpSession session, String checkedName) throws Exception {
		String loginId = (String)session.getAttribute("loginId");
		String loginAddr = (String)session.getAttribute("loginAddr");
		String maxrecode = mkdao.selectMaxRenum();
		System.out.println("결제정보 번호 최대값 : " + maxrecode);
		String recode = "RE";
		if (maxrecode == null) {
			recode = recode + String.format("%03d", 1);
			System.out.println("처음 결제정보 코드 : " + recode);
		} else {
			int prcodeNum = Integer.parseInt(maxrecode.replace("RE", "")) + 1;
			recode = recode + String.format("%03d", prcodeNum);
		}
		System.out.println("결제정보 코드 : " + recode);
		reInfo.setRecode(recode);
		reInfo.setReid(loginId);
		reInfo.setReaddr(loginAddr);
		
    	
		
		try {
			mkdao.insertReservation(reInfo);
		
		} catch (Exception e) {
			System.out.println("KAKAO결제준비 요청중 예외");
			e.printStackTrace();
			return "Fail";
		}
		
	    StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/ready"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=TC0ONETIME"); /* cid  테스트 가맹점 코드 */
        urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(recode, "UTF-8")); /* 가맹점 예매코드, 최대 100자 */
        urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8")); /* 가맹점 회원 id, 최대 100자 */
        urlBuilder.append("&" + URLEncoder.encode("item_name","UTF-8") + "=" + URLEncoder.encode("결제테스트", "UTF-8")); /* 상품명, 최대 100자 */
       urlBuilder.append("&" + URLEncoder.encode("quantity","UTF-8") + "=" + URLEncoder.encode(reInfo.getRemoney()+"", "UTF-8")); /* 상품 수량 */
        urlBuilder.append("&" + URLEncoder.encode("total_amount","UTF-8") + "=" + URLEncoder.encode( (reInfo.getRemoney())+"", "UTF-8")); /* 상품 총액 */
        urlBuilder.append("&" + URLEncoder.encode("tax_free_amount","UTF-8") + "=" + URLEncoder.encode("0", "UTF-8")); /* 상품 비과세 금액 */
        urlBuilder.append("&" + URLEncoder.encode("approval_url","UTF-8") 
                                + "=" + URLEncoder.encode("http://localhost:8081/controller/reservePro_PayApproval?recode="+recode, "UTF-8")); /* 결제 성공 시 redirect url, 최대 255자 */
        urlBuilder.append("&" + URLEncoder.encode("cancel_url","UTF-8") 
                                + "=" + URLEncoder.encode("http://localhost:8081/controller/reservePro_PayCancel?recode="+recode, "UTF-8")); /* 결제 취소 시 redirect url, 최대 255자 */
        urlBuilder.append("&" + URLEncoder.encode("fail_url","UTF-8") 
        	                    + "=" + URLEncoder.encode("http://localhost:8081/controller/reservePro_PayFail?recode="+recode, "UTF-8")); /* 결제 실패 시 redirect url, 최대 255자 */        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK "+"e4e76bf9b604e4bd91c5095c97594596");
        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());		
		JsonElement readyElement = JsonParser.parseString(sb.toString());
		JsonObject readyObj = readyElement.getAsJsonObject();
		String tid = readyObj.get("tid").getAsString();
		System.out.println("tid : " + tid);
		session.setAttribute("payTid", tid);
		
		String testCode = reInfo.getReprcode();
		System.out.println("testCode: " + testCode);
		session.setAttribute("testCode", testCode);

		
		String nextPcUrl = readyObj.get("next_redirect_pc_url").getAsString();
		System.out.println(nextPcUrl);
		
		return nextPcUrl;  
		
		
	
 
	}


	public String reservePro_PayApproval(String tid, String pg_token, String recode, HttpSession session) throws Exception {
		String loginId = (String)session.getAttribute("loginId");
		StringBuilder urlBuilder = new StringBuilder("https://kapi.kakao.com/v1/payment/approve"); 
        urlBuilder.append("?" + URLEncoder.encode("cid","UTF-8") + "=" + URLEncoder.encode("TC0ONETIME", "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("tid","UTF-8") + "=" + URLEncoder.encode(tid, "UTF-8"));
        urlBuilder.append("&" + URLEncoder.encode("partner_order_id","UTF-8") + "=" + URLEncoder.encode(recode, "UTF-8")); 

        urlBuilder.append("&" + URLEncoder.encode("partner_user_id","UTF-8") + "=" + URLEncoder.encode(loginId, "UTF-8")); 
        urlBuilder.append("&" + URLEncoder.encode("pg_token","UTF-8") + "=" + URLEncoder.encode(pg_token, "UTF-8"));		
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "KakaoAK "+"e4e76bf9b604e4bd91c5095c97594596");
        conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        System.out.println("Response code: " + conn.getResponseCode());
        String result = "Fail";
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            result = "reserveResult";
      
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            mkdao.deleteReservation(recode);
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        System.out.println(sb.toString());		
        if(result.equals("reserveResult")) {
        	String total = JsonParser.parseString(sb.toString()).getAsJsonObject().get("amount").getAsJsonObject().get("total").getAsString();
        	System.out.println("total : " + total);
        	mkdao.insertPayInfo(recode,tid,loginId,total);
        	
        
        	
        }
		return result;
	}


	public int deleteReserveInfo(String recode) {
		System.out.println("SERVICE-결제 되지 않음");
		
		int deleteResult = mkdao.deleteReservation(recode);
		return deleteResult;
	}


	public int updatePro(String testCode) {
	    int upPr = mkdao.updatePayinfo(testCode);
		return upPr;
	}


//	public int insertRe(ReserveDto reserve) {
//		int insertResult = 0;
//		try {
//			 insertResult = mkdao.insertRes(reserve);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return insertResult;
//	}


	
	
}

























