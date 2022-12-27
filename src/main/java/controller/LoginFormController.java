package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Member;

@WebServlet("/LoginFormController")
public class LoginFormController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	   Member loginMember = (Member)session.getAttribute("loginMember");
	   if(loginMember != null) { // 이미 로그인 상태
    	  System.out.println("로그인 중");
    	  response.sendRedirect(request.getContextPath()+"/BoardListConteroller");
    	  return;
	   }
      
	   // 폼 View
	   request.getRequestDispatcher("/WEB-INF/view/loginForm.jsp").forward(request, response);
	
	}

}
