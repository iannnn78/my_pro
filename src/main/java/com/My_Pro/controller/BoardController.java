package com.My_Pro.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.My_Pro.dto.BoardDto;
import com.My_Pro.dto.ReplyDto;
import com.My_Pro.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bsvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping (value = "/boardList")
	public ModelAndView boardList() {
		System.out.println("게시판으로 이동");
		ModelAndView mav = new ModelAndView();
		ArrayList<BoardDto> boardList = bsvc.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("board/BoardList");
		return mav;
	}
	
	@RequestMapping (value = "/boardWritePage")
	public ModelAndView boardWritePage() {
		System.out.println("글작성 페이지로");
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("loginId") != null) {
			//로그인이 되어 있을 경우 >> 글작성 페이지로
			mav.setViewName("board/BoardWrite");
		} else {
			//로그인이 되어 있지 않을 경우 >> 로그인 페이지로
			mav.setViewName("redirect:/memberLoginForm");
		}
		return mav;
	}
	
	@RequestMapping(value = "/boardWrite")
	public ModelAndView boardWrite(BoardDto board) throws IllegalStateException, IOException {
		System.out.println("새 글 등록 요청");
		ModelAndView mav = new ModelAndView();
		//1. session에서 로그인 아이디 확인
		if(session.getAttribute("loginId") == null) {
			System.out.println("로그인 안하면 글 못씀");
			mav.setViewName("redirect:/memberLoginForm");
			return mav;
		}
		String loginId = (String)session.getAttribute("loginId");
		//2.board.bwriter(작성자)에 저장
		board.setBid(loginId);
		System.out.println(board);
		//3. 글등록 서비스 호출
		int writeResult = bsvc.boardWrite(board);
		if(writeResult> 0 ) { // 글 등록에 성공 했을 경우
			//글목록 페이지 이동요청
			mav.setViewName("redirect:/boardList");
		} else { // 글 등록에 실패 했을 경우
			//글작성 페이지 이동요청
			mav.setViewName("redirect:/boardWritePage");
		}
		
		return mav;	
	}
	
	@RequestMapping(value = "/boardModify")
	public ModelAndView boardModify(BoardDto modBoard, RedirectAttributes ra) {
		System.out.println("글수정 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println(modBoard);
		//1. 글 수정 기능 호출
		int modifyResult = bsvc.boardModify(modBoard);
		if(modifyResult > 0) {
			ra.addFlashAttribute("boardMsg", "글이 수정 되었습니다.");
		} else {
			ra.addFlashAttribute("boardMsg", "글이 수정에 실패하였습니다.");
		}
		
		mav.setViewName("redirect:/boardView?viewBno="+modBoard.getBno());
		return mav;
	}	
	
	@RequestMapping(value = "/boardView")
	public ModelAndView boardView(int viewBno) {
		System.out.println("상세보기 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		System.out.println("상세보기 글번호 : " + viewBno);
		//1. 글 상세 정보 조회
		BoardDto board = bsvc.boardView(viewBno);
		System.out.println(board);
		
		mav.addObject("board", board);
		//2. 글 상세보기 페이지 이동
		ArrayList<BoardDto> boardHit = bsvc.selectBoardHit();
		mav.addObject("boardHit", boardHit);
		//3.댓글보기
		ArrayList<ReplyDto> replyList = bsvc.replyView(viewBno);
		mav.addObject("replyList", replyList);
		mav.setViewName("board/BoardView");
		return mav;
	}
	
	@RequestMapping(value = "/deleteWrite")
	public @ResponseBody String deleteWrite(int viewBno) {
		System.out.println("글삭제");
		
		System.out.println("삭제할 글번호 : " + viewBno);
		int delboard = bsvc.deleteView(viewBno);
		
		return delboard + "";
		
		
	}
	
	@RequestMapping(value = "/replyWrite")
	public @ResponseBody String replyWrite(ReplyDto reply) {
		System.out.println("댓글 등록 요청");
		System.out.println(reply);
		int insertResult = bsvc.replyWrite(reply);
		return insertResult + "";
	}

	@RequestMapping(value = "/replyList")
	public @ResponseBody String replyList(String rno) {
		System.out.println("댓글 목록 조회 요청");
		System.out.println("댓글을 조회할 글번호 : " + rno);
	
		String loginId = null;
	
	
		String replyList = bsvc.replyList(rno, loginId);
		return replyList;
	}

	
	
}
