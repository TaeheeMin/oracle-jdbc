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

@WebServlet("/ModifyBoardActionController")
public class ModifyBoardActionController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 유효성 검사 
		if(request.getParameter("title") == null || request.getParameter("title").equals("")
			|| request.getParameter("content") == null || request.getParameter("content").equals("")
			|| request.getParameter("boardNo") == null) {
			response.sendRedirect(request.getContextPath() + "/BoardListController");
			System.out.println("ModifyBoardAction 유효성 검사 실패");
			return;
		}
		
		// 값 받아오기
		Board board = new Board();
		board.setBoardNo(Integer.parseInt(request.getParameter("boardNo")));
		board.setBoardTitle(request.getParameter("title"));
		board.setBoardContent(request.getParameter("content"));
		board.setMemberId(loginMember.getMemberId());
		
		// db연결
		int result = 0;
		BoardService boardService = new BoardService();
		result = boardService.modifyBoard(board);
		
		// 결과
		if(result == 1) {
			// 리스트로 이동
			System.out.println("수정성공");
			response.sendRedirect(request.getContextPath()+"/BoardListController"); 
		} else {
			// 폼이동
			System.out.println("수정실패");
			response.sendRedirect(request.getContextPath()+"/ModifyBoardFormController?boardNo="+board.getBoardNo());
		}
	}

}