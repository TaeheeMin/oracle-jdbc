package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import vo.Member;


@WebServlet("/AddMember")
public class AddMemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 이미 로그인 상태
			System.out.println("로그인 중");
			response.sendRedirect(request.getContextPath()+"/BoardList");
			return;
		}
      
		// 폼 View
		request.getRequestDispatcher("/WEB-INF/view/member/addMember.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 유효성 검사 
		if(request.getParameter("memberId") == null
			|| request.getParameter("memberId").equals("")
			|| request.getParameter("memberName") == null
			|| request.getParameter("memberName").equals("")
			|| request.getParameter("memberPw1") == null
			|| request.getParameter("memberPw1").equals("")
			|| request.getParameter("memberPw2") == null
			|| request.getParameter("memberPw2").equals("")) {
			response.sendRedirect(request.getContextPath() + "/AddMember");
			System.out.println("SigninActionController 유효성X");
			return;
		}
		
		String memberPw = null;
		if(request.getParameter("memberPw1").equals(request.getParameter("memberPw2"))) {
			memberPw = request.getParameter("memberPw1");
		}
		
		// 값 받아오기
		Member member = new Member();
		member.setMemberId(request.getParameter("memberId"));
		member.setMemberPw(memberPw);
		member.setMemberName(request.getParameter("memberName"));
		
		
		int result = 0;
		MemberService memberService = new MemberService();
		result = memberService.memberCheck(request.getParameter("memberId"));
		// 아이디 중복결과
		if(result == 1) {
			// 리스트로 이동
			System.out.println("중복있음");
			response.sendRedirect(request.getContextPath()+"/AddMember");
			return;
		}
		
		// 가입 결과
		result = memberService.addMember(member);
		if(result == 1) {
			// 리스트로 이동
			System.out.println("가입성공");
			response.sendRedirect(request.getContextPath()+"/BoardList"); 
		} else {
			// 폼이동
			System.out.println("가입실패");
			response.sendRedirect(request.getContextPath()+"/AddMember");
		}
	}
}
