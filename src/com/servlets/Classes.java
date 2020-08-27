package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Classes extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Classes.jsp").forward(req, resp);
	}

}
