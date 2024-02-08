package com.My_Pro.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.HitterDto;
import com.My_Pro.dto.HscrapDto;
import com.My_Pro.dto.MemberDto;
import com.My_Pro.dto.ProductDto;
import com.My_Pro.dto.PscrapDto;
import com.My_Pro.dto.ReserveDto;

public interface MemberDao {

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MAGE, MADDR, MEMAIL, MSTATE) "
			   + "VALUES(#{mid}, #{mpw}, #{mname},#{mage}, "
			          + "#{maddr}, #{memail}, '0' )")
	int insertMember(MemberDto member);

	@Select("SELECT MID, MPW, MNAME, MADDR, MAGE, MEMAIL FROM MEMBERS WHERE MID= #{mid} AND MPW= #{mpw} AND MSTATE = '0' ")
	MemberDto Loginlogn(@Param("mid") String inputMid, @Param("mpw") String inputMpw);

	@Select("SELECT * FROM BOARDS WHERE BID = #{loginId} ")
	ArrayList<BoardDto> selectMyBoard(String loginId);
	
	@Select("SELECT * FROM HSCRAP WHERE HSCID = #{loginId} ")
	ArrayList<HscrapDto> selectMyHitter(String loginId);

	@Select("SELECT * FROM RESERVE WHERE REID = #{loginId} ")
	ArrayList<ReserveDto> selctMyReserve(String loginId);

	@Select("SELECT MID FROM MEMBERS WHERE MID = #{mid} AND MSTATE = '0'")
	String selectMCheckId(String mid);
	
	@Update("UPDATE MEMBERS SET MPW=#{pw}, MNAME=#{name}, MADDR=#{addr} WHERE MID = #{id}")
	int updateInfo(@Param("id") String id, @Param("pw") String pw, @Param("name") String name,
			@Param("addr") String addr);

	@Update("UPDATE MEMBERS SET MSTATE='1' WHERE MID = #{loginId}")
	int updateState(String loginId);


	@Select("SELECT MPW FROM MEMBERS WHERE MID = #{id} AND MSTATE = '0'")
	String selectMemberPw(String loginId);

	@Select("SELECT * FROM PSCRAP WHERE PSCID = #{loginId} ")
	ArrayList<PscrapDto> selectMyPitcher(String loginId);

	@Select("SELECT * FROM PRODUCT WHERE PRID = #{loginId} AND PRSTATE = '1' ")
	ArrayList<ProductDto> selctMyProYes(String loginId);

	@Select("SELECT * FROM PRODUCT WHERE PRID = #{loginId} AND PRSTATE = '0' ")
	ArrayList<ProductDto> selctMyProNo(String loginId);

}
