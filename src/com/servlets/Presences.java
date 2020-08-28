package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.Cours;
import com.beans.CoursBean;
import com.beans.Note;
import com.beans.Personne;
import com.beans.Presence;
import com.beans.PresenceBean;

public class Presences extends HttpServlet {

	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN,Roles.DIRECTEUR,Roles.PROF);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Load
		try {
			List<com.beans.Cours> cours;
			if(req.getParameter("search") != null) {
				//Filter
				cours = new CoursBean().getAll('%'+req.getParameter("search"));
			}else {
				cours = new CoursBean().getAll();
				
			}
			req.setAttribute("cours", cours);
			
			Map<com.beans.Cours,List<Presence>> coursPresences = new HashMap<>();
			for(com.beans.Cours c : cours) {
				List<Presence> presences = new PresenceBean().getAll(c);
				
				coursPresences.put(c, presences);
			}
			req.setAttribute("presences", coursPresences);
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Presences.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
				
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Check request
		String cours = req.getParameter("cours");
		
		Map<String, String> feedback = new HashMap<String,String>();
		
		if(cours == null || cours.isEmpty()) {
			feedback.put("cours","Merci de renseigner un cours");
		}
		
		if(feedback.isEmpty()) {
			
			//Check présences
			try {
				Cours c = new CoursBean().get(Integer.valueOf(cours));
				List<Presence> presences = new PresenceBean().getAll(c);
				
				for(Presence p : presences) {
					if(req.getParameter(String.valueOf(p.getPersonne().getId())) == null) {
						p.setPresent(false);
					}else {
						p.setPresent(true);
					}
					new PresenceBean().update(p);
				}
				
				resp.sendRedirect(req.getContextPath()+"/presences");
				return;
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		req.setAttribute("feedback",feedback);
		this.doGet(req, resp);
	}
	
	

}
