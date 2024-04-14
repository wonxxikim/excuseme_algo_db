package com.ssafy.trip.member.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ssafy.trip.member.model.MemberDto;
import com.ssafy.trip.member.service.MemberServiceImpl;
@WebServlet("/user")

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberController() {}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String path = "";
		if(action.equals("login")) {
			path = login(request,response);
			redirect(request,response,path);
		}else if(action.equals("main")) {
			path = "/index.jsp";
			redirect(request,response,path);
		}else if(action.equals("error")) {
			path = "/error.jsp";
			redirect(request,response,path);
		}else if(action.equals("mvlogin")) {
			path = "/login.jsp";
			redirect(request,response,path);
		}else if(action.equals("logout")) {
			path = logout(request,response);
			redirect(request,response,path);
		}else if(action.equals("mvsignup")) {
			path = "/signup.jsp";
			redirect(request,response,path);
		}else if(action.equals("signup")) {
			path = signup(request,response);
			redirect(request,response,path);
		}else if(action.equals("mvmodify")) {
			path = mvmodify(request, response);
			forward(request, response, path);
		}else if(action.equals("mypage")) {
			path = mypage(request,response);
			forward(request,response,path);
		}else if(action.equals("modify")) {
			path = modify(request,response);
			redirect(request,response,path);
		}else if(action.equals("resign")) {
			path = resign(request,response);
			redirect(request,response,path);
		}else if(action.equals("mvfindPW")) {

		}
	}
	private void forward(HttpServletRequest request, HttpServletResponse response, String path)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private void redirect(HttpServletRequest request, HttpServletResponse response, String path) throws IOException {
		response.sendRedirect(request.getContextPath() + path); //풀 경로
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("userid");
		String pw = request.getParameter("userpwd");
		try {
			if(MemberServiceImpl.getInstance().login(id, pw)) {
				HttpSession session = request.getSession();
				session.setAttribute("userId", id);
				return "/user?action=main";
			}else return "/user?action=mvlogin";
			
		}catch(Exception e){
			e.printStackTrace();
			return "/user?action=error";
		}
	}
	private String logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("userId");
		return "/user?action=main";
	}
	private String signup(HttpServletRequest request, HttpServletResponse response) {
		MemberDto memberDto = new MemberDto();
		memberDto.setUserId(request.getParameter("userId"));
		memberDto.setUserPassword(request.getParameter("userPassword"));
		memberDto.setUserName(request.getParameter("userName"));
		memberDto.setEmail(request.getParameter("email"));
		if(MemberServiceImpl.getInstance().signup(memberDto)){
			return "/user?action=mvlogin";
		}else {
			return "/user?action=error";
		}
	}
	private String mvmodify(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		MemberDto memberDto = MemberServiceImpl.getInstance().getUserInfo(id);
		request.setAttribute("userInfo", memberDto);
		return "/modify.jsp";
	}
	private String mypage(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		MemberDto memberDto = MemberServiceImpl.getInstance().getUserInfo(id);
		System.out.println("mypage id = "+memberDto.getUserId());
		request.setAttribute("userInfo", memberDto);
		return "/mypage.jsp";
	}
	private String modify(HttpServletRequest request, HttpServletResponse response)  {
		MemberDto memberDto = new MemberDto();
		HttpSession session = request.getSession();
		System.out.println((String) session.getAttribute("userId"));
		memberDto.setUserId((String) session.getAttribute("userId"));
		memberDto.setUserPassword(request.getParameter("userPassword"));
		memberDto.setEmail(request.getParameter("email"));
		if(MemberServiceImpl.getInstance().modify(memberDto)) {
			return "/user?action=mypage";
		}
		return "/user?action=error"; 
	}
	private String resign(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		if(MemberServiceImpl.getInstance().resign(id)) {
			session.removeAttribute("userId");
			return "/user?action=main";
		}
		return "/user?action=error"; 
	}
}
