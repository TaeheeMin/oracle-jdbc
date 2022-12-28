package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.MemberService;
import vo.Member;


@WebServlet("/RemoveMember")
public class RemoveMemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 폼 View
		request.getRequestDispatcher("/WEB-INF/view/member/removeMember.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 컨트롤러 요청
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 유효성 검사 
		if(request.getParameter("memberPw") == null || request.getParameter("memberPw").equals("")) {
			System.out.println("RemoveMember 유효성 검사 실패");
			response.sendRedirect(request.getContextPath() + "/RemoveMember");
			return;
		}
		
		// 값 받아오기
		String memberPw= request.getParameter("memberPw");
		
		int result = 0;
		MemberService memberService = new MemberService();
		result = memberService.removeMember(loginMember.getMemberId(), memberPw);
		
		request.setAttribute("loginMember", loginMember);
		
		// 결과
		if(result == 1) {
			// one으로 이동
			System.out.println("탈퇴성공");
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath()+"/Home"); 
		} else {
			// 폼이동
			System.out.println("탈퇴실패");
			response.sendRedirect(request.getContextPath()+"/RemoveMember");
		}
	}

}
