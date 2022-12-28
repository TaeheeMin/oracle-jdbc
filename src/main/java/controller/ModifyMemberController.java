package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.MemberService;
import vo.Board;
import vo.Member;


@WebServlet("/ModifyMember")
public class ModifyMemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = (String)loginMember.getMemberId();
		// System.out.println(memberId);
		
		MemberService memberService = new MemberService();
		Member member = memberService.getMemberOne(memberId);
		
		// view와 공유할 모델 데이터 설정
		request.setAttribute("member", member);
		// view 연결
		request.getRequestDispatcher("/WEB-INF/view/member/modifyMember.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		String memberId = (String)loginMember.getMemberId();
		System.out.println(memberId);
		
		// 유효성 검사 
		if(request.getParameter("memberName") == null || request.getParameter("memberName").equals("")
				|| request.getParameter("memberPw") == null || request.getParameter("memberPw").equals("")) {
			System.out.println("ModifyMemberAction 유효성 검사 실패");
			response.sendRedirect(request.getContextPath() + "/ModifyMember");
			return;
		}
		System.out.println(request.getParameter("memberName"));
		System.out.println(request.getParameter("memberPw"));
		System.out.println();
		
		// 값 받아오기
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberName(request.getParameter("memberName"));
		member.setMemberPw(request.getParameter("memberPw"));
		
		// db연결
		int result = 0;
		MemberService memberService = new MemberService();
		result = memberService.modifyMember(member);
		System.out.println(result);
		
		// 결과
		if(result == 1) {
			// 리스트로 이동
			System.out.println("수정성공");
			session.setAttribute("loginMember", member);
			response.sendRedirect(request.getContextPath()+"/BoardList"); 
		} else {
			// 폼이동
			System.out.println("수정실패");
			response.sendRedirect(request.getContextPath()+"/ModifyMember");
		}
	}

}
