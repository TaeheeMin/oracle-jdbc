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

@WebServlet("/LoginActionController")
public class LoginActionController extends HttpServlet {
	private MemberService memberService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		// 로그인O -> list 이동
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember != null) {
			System.out.println("로그인중");
			response.sendRedirect(request.getContextPath()+"/BoardListConteroller");
			return;
		}
		
		// 유효성 검사 -> form 이동
		if(request.getParameter("memberId") == null 
				|| request.getParameter("memberId").equals("") 
				|| request.getParameter("memberPw") == null 
				|| request.getParameter("memberPw").equals("") ) {
			response.sendRedirect(request.getContextPath()+"/WEB-INF/view/loginForm.jsp");
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
	    	response.sendRedirect(request.getContextPath()+"/LoginFormController");
	    	return;
	    }

	    // 로그인 성공시 session에 정보 저장 -> home이동
	    System.out.println("로그인 성공 " + returnMember.getMemberId() + " <- Login Action Id");
	    session.setAttribute("loginMember", returnMember);
	    response.sendRedirect(request.getContextPath()+"/BoardListConteroller");
	}
}
