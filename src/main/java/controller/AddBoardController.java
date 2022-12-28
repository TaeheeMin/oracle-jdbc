package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/AddBoard")
public class AddBoardController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		// 로그인X -> 로그인폼 이동
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			System.out.println("로그인 필요");
			response.sendRedirect(request.getContextPath()+"/Login");
			return;
		}
		request.getRequestDispatcher("/WEB-INF/view/board/addBoardForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		// System.out.println(loginMember.getMemberId());
		
		// 유효성 검사 
		if(request.getParameter("title") == null
				|| request.getParameter("title").equals("")
				|| request.getParameter("content") == null
				|| request.getParameter("content").equals("")) {
			response.sendRedirect(request.getContextPath() + "/AddBoard");
			System.out.println("AddBoardAction 유효성X");
			return;
		}
		
		// 값 받아오기
		Board board = new Board();
		board.setBoardTitle(request.getParameter("title"));
		board.setBoardContent(request.getParameter("content"));
		board.setMemberId(loginMember.getMemberId());
		
		
		int result = 0;
		BoardService boardService = new BoardService();
		result = boardService.addBoard(board);
		
		// 결과
		if(result == 1) {
			// 리스트로 이동
			System.out.println("입력성공");
			response.sendRedirect(request.getContextPath()+"/BoardList"); 
		} else {
			// 폼이동
			System.out.println("입력실패");
			response.sendRedirect(request.getContextPath()+"/AddBoard");
		}
	}

}
