package com.My_Pro.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.My_Pro.dao.BoardDao;
import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.ReplyDto;

@Service
public class BoardService {

	@Autowired
	private BoardDao bdao;
	
	@Autowired
	private ServletContext context;
	
	public ArrayList<BoardDto> boardList() {
System.out.println("글목록파일가져오기service");
ArrayList<BoardDto> boardList = bdao.boardList();

		return boardList;
	}

	public int boardWrite(BoardDto board) throws IllegalStateException, IOException {
		System.out.println("BoardService boardWrite()");
		//1.글번호
		int bno = bdao.selectMaxBno() + 1 ;
		board.setBno(bno);
		
		//2.첨부파일
		MultipartFile bfile = board.getBfile();
		String bfilename = "";
		if(bfile != null && !bfile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			bfilename = uuid.toString() + "_" + bfile.getOriginalFilename();
			String savePath = context.getRealPath("resources\\uploadBoard");
			File file = new File(savePath,bfilename);
			bfile.transferTo(file);
		}
		board.setBfilename(bfilename);
		int insertResult = 0;
		try {
			insertResult = bdao.insertBoard(board);
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
		return insertResult;

	}

	public BoardDto boardView(int viewBno) {
		System.out.println("BoardService boardList()");
		//조회수 증가
		bdao.updateBoardHits(viewBno);
		
		//글 정보 조회
		BoardDto board = bdao.selectBoardView(viewBno);
		
		return board;
	}

	public int deleteView(int viewBno) {
		System.out.println("service-글삭제");
		int board = bdao.deleteBoardView(viewBno);
		 
		return board;
	}

	public int replyWrite(ReplyDto reply) {
	System.out.println("service-댓작성");
	
	int insertResult = 0;
	try {
		 insertResult = bdao.insertReply(reply);

	} catch (Exception e) {
		e.printStackTrace();
	}
	return insertResult;
	}

	public ArrayList<ReplyDto> replyView(int viewBno) {
		ArrayList<ReplyDto> replyView = bdao.replyView(viewBno);
		return replyView;
	}

	public String replyList(String rno, String loginId) {
	System.out.println("댓글읽기");
	ArrayList<ReplyDto> rList = bdao.replyList(rno);
		return null;
	}

	public int boardModify(BoardDto modBoard) {
System.out.println("글 수정");

int updateResult = 0;
try {
	updateResult = bdao.updateBoard(modBoard);
} catch (Exception e) {
	e.printStackTrace();
}
		return updateResult;
	}

	public ArrayList<BoardDto> selectBoardHit() {
		System.out.println("인기글 서비스");
		ArrayList<BoardDto> boardHit = bdao.selectBoardHit();
		return boardHit;
	}



}
