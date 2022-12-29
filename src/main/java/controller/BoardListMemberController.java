package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import vo.Board;
import vo.Member;

@WebServlet("/BoardListMember")
public class BoardListMemberController extends HttpServlet {
	private BoardService boardService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) {
			System.out.println("로그인 필요");
			response.sendRedirect(request.getContextPath()+"/LoginController");
			return;
		}

		// 1) currentPage		
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		// System.out.println("currentPage : " + currentPage);
		
		// 2) rowPerPage
		int rowPerPage = 15; // 내 게시글 보기는 고정
		
		String memberId = loginMember.getMemberId();
		this.boardService = new BoardService();
		ArrayList<Board> list = new ArrayList<Board>();
	
		list = boardService.getBoardListByMember(currentPage, rowPerPage, memberId);
		
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.getRequestDispatcher("WEB-INF/view/member/memberBoard.jsp").forward(request, response);
	}

}
