package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/memberOne")
public class MemberOneController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 뷰로 이동 -> WEB-INF/member/memberOne.jsp
		// 메뉴규성
		// 1) 회원정보 수정
		// 2) 회원탈퇴
		// 3) 게시글 관리
	}
}
