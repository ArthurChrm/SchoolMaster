package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.CoursBean;
import com.beans.Personne;
import com.beans.PersonneBean;

public class Eleves extends HttpServlet {
	
	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN,Roles.DIRECTEUR);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		PersonneBean pb = new PersonneBean();
		List<Personne> eleves = new ArrayList<Personne>();
		try {
			eleves = pb.getAll().stream().filter(p->p.getRole().getId() == Roles.ELEVE.getId()).collect(Collectors.toList());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		req.setAttribute("eleves", eleves);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Eleves.jsp").forward(req, resp);
	}

}
