package com.servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.Personne;

public class Eleves extends HttpServlet {
	
	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN,Roles.DIRECTEUR);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Eleves.jsp").forward(req, resp);
	}

}
