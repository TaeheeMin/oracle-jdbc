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


@WebServlet("/BoardList")
public class BoardListController extends HttpServlet {
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
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage") != null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		// System.out.println("rowPerPage : " + rowPerPage);
		
		// 3) 카테고리
		String category = request.getParameter("category"); 
		if(request.getParameter("category") == null) {
			category = "board_title";
		}
		// System.out.println("category : " + category);
		
		// 4) 검색어
		String word = request.getParameter("word");
		// System.out.println("word : " + word);
		
		this.boardService = new BoardService();
		ArrayList<Board> list = new ArrayList<Board>();
		
		// 검색어 분기
		if(word == null || word.equals("")) {
			list = boardService.getBoardListByPage(currentPage, rowPerPage);
			// System.out.println("검색안됨");
		} else if(word != null ){
			list = boardService.getBoardListBySearch(currentPage, rowPerPage, category ,word);
			// System.out.println("검색함");
			// System.out.println("category : " + category + " / word : " + word );
		}
		
		// 5) 페이징
		int count = boardService.getBoardCount();
		
		request.setAttribute("boardList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("word", word);
		request.setAttribute("count", count);
		request.getRequestDispatcher("WEB-INF/view/board/boardList.jsp").forward(request, response);
	}
}