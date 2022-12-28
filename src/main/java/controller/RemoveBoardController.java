package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Member;


@WebServlet("/RemoveBoard")
public class RemoveBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 유효성 검사 
		if(request.getParameter("boardNo") == null) {
			response.sendRedirect(request.getContextPath() + "/BoardList");
			System.out.println("RemoveBoardAction 유효성X");
			return;
		}
		
		// 값 받아오기
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		BoardService boardService = new BoardService();
		int result = boardService.removeBoard(boardNo, loginMember.getMemberId());
		
		// 결과
		if(result == 1) {
			// one으로 이동
			System.out.println("삭제성공");
			response.sendRedirect(request.getContextPath()+"/BoardList"); 
		} else {
			// 폼이동
			System.out.println("삭제실패");
			response.sendRedirect(request.getContextPath()+"/BoardOne?boardNo="+boardNo);
		}
	}
}
