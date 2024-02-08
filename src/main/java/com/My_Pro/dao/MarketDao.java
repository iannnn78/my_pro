package com.My_Pro.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.My_Pro.dto.ProductDto;
import com.My_Pro.dto.ReserveDto;

public interface MarketDao {

	@Select("SELECT PRCODE,PRID,PRTITLE, PRCONTENTS, PRMONEY, PRFILENAME, PRDATE FROM PRODUCT WHERE PRSTATE = '0' ")
	ArrayList<ProductDto> selectPdList();

	@Select("SELECT NVL( MAX(PRCODE),0 ) FROM PRODUCT ")
	String selectMaxPrnum();

	@Insert("INSERT INTO PRODUCT(PRCODE, PRID, PRTITLE, PRCONTENTS, PRMONEY, PRFILENAME, PRDATE, PRSTATE) " 
	+ "VALUES(#{prcode}, #{prid}, #{prtitle}, #{prcontents}, #{prmoney}, #{prfilename}, SYSDATE, '0') ")
	int insertProduct(ProductDto product);

	@Select("SELECT * FROM PRODUCT WHERE PRCODE = #{viewPrcode} ")
	ProductDto selectPdView(String viewPrcode);
	
	@Select("SELECT NVL( MAX(RECODE),0 ) FROM RESERVE ")
	String selectMaxRenum();

	@Insert("INSERT INTO RESERVE(RECODE, REID, REPRCODE, REDATE, RETITLE, REMONEY, READDR) "
			  + "VALUES(#{recode}, #{reid}, #{reprcode}, SYSDATE, #{retitle},  #{remoney}, #{readdr} )")
	int insertReservation(ReserveDto reInfo);

	@Insert("INSERT INTO PAYINFO(RECODE, TID, MID, CANCEL_AMOUNT) "
			  + "VALUES(#{recode}, #{tid}, #{mid}, #{total} )")
	int insertPayInfo(@Param("recode") String recode, @Param("tid")String tid, @Param("mid")String loginId, @Param("total")String total);

	@Delete("DELETE FROM RESERVE WHERE RECODE = #{recode} ")
	int deleteReservation(String recode);
	
	@Update("UPDATE PRODUCT SET PRSTATE= '1' WHERE PRCODE = #{testCode} ")
	int updatePayinfo(@Param("testCode") String testCode);
	



}
