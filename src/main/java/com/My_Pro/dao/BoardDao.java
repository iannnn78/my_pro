package com.My_Pro.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.ReplyDto;

public interface BoardDao {

	@Select("SELECT * FROM BOARDS WHERE BSTATE = '0' ORDER BY BDATE DESC")
	ArrayList<BoardDto> boardList();

	@Select("SELECT NVL( MAX(BNO),0 ) FROM BOARDS ")
	int selectMaxBno();

	@Insert("INSERT INTO BOARDS(BNO, BTITLE, BID, BCONTENTS, BDATE, BVIEWS, BCATE, BFILENAME, BSTATE ) "
			  + "VALUES(#{bno}, #{btitle}, #{bid}, #{bcontents}, SYSDATE, 0, #{bcate}, #{bfilename}, '0' )")
	int insertBoard(BoardDto board);
	
	@Update("UPDATE BOARDS "
			  + "SET BVIEWS = BVIEWS + 1 "
			  + "WHERE BNO = #{viewBno}")
	void updateBoardHits(int viewBno);
	
	@Select("SELECT * FROM BOARDS "
			  + "WHERE BNO = #{viewBno}")
	BoardDto selectBoardView(int viewBno);

	@Delete("DELETE FROM BOARDS WHERE BNO = #{viewBno}")
	int deleteBoardView(int viewBno);

	@Insert("INSERT INTO REPLYS(RNO, RID, RCONTENTS, RDATE, RSTATE  )"
			+ "VALUES(#{rno},#{rid},#{rcontents},SYSDATE, '0' )")
	int insertReply(ReplyDto reply);

	@Select("SELECT R.* " + "FROM REPLYS R, MEMBERS M " + "WHERE ( R.RID = M.MID ) AND RNO = #{rno}" )
	ArrayList<ReplyDto> replyView(int viewBno);

	@Insert("INSERT INTO REPLYS(RNO, RID, RCONTENTS, RDATE, RSTATE ) "
			+ "VALUES( #{rno}, #{rid}, #{rcontents},SYSDATE, '0' )")
	ArrayList<ReplyDto> replyList(String rno);

	@Update("UPDATE BOARDS "
			  + "SET BTITLE = #{btitle}, BCONTENTS = #{bcontents} "
			  + "WHERE BNO = #{bno}")	
	int updateBoard(BoardDto modBoard);

	@Select("SELECT * FROM (SELECT * FROM BOARDS ORDER BY BVIEWS DESC) WHERE ROWNUM <= 5 ")
	ArrayList<BoardDto> selectBoardHit();

}
