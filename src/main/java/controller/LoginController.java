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

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private MemberService memberService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) { // 이미 로그인 상태
			System.out.println("로그인 중");
			response.sendRedirect(request.getContextPath()+"/BoardList");
			return;
		}
      
		// 폼 View
		request.getRequestDispatcher("/WEB-INF/view/member/loginForm.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 액션
		// 로그인 세션 정보 session.Atrribute("loginMember", Member)
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// 로그인O -> list 이동
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			System.out.println("로그인중");
			response.sendRedirect(request.getContextPath()+"/BoardList");
			return;
		}
		
		// 유효성 검사 -> form 이동
		if(request.getParameter("memberId") == null 
				|| request.getParameter("memberId").equals("") 
				|| request.getParameter("memberPw") == null 
				|| request.getParameter("memberPw").equals("") ) {
			response.sendRedirect(request.getContextPath()+"/LoginController");
			System.out.println("LoginController 유효성X");
			return;
		}
		
		// 값 받아오기
		String memberId = request.getParameter("memberId");
	    String memberPw = request.getParameter("memberPw");
	    
	    Member paramMember = new Member(); // request 파라미터값으로 바인딩
	    paramMember.setMemberId(memberId);
	    paramMember.setMemberPw(memberPw);
	    
	    this.memberService = new MemberService();
	    Member returnMember = memberService.login(paramMember);
  
	    // 로그인 실패시 폼으로 이동
	    if(returnMember == null) {
	    	System.out.println("로그인 실패");
	    	response.sendRedirect(request.getContextPath()+"/LoginController");
	    	return;
	    }

	    // 로그인 성공시 session에 정보 저장 -> home이동
	    System.out.println("로그인 성공 " + returnMember.getMemberId() + " <- Login Action Id");
	    session.setAttribute("loginMember", returnMember);
	    response.sendRedirect(request.getContextPath()+"/BoardList");
	}

}
