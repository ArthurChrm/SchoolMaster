package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Password;
import com.beans.Personne;
import com.beans.PersonneBean;

public class Connexion extends HttpServlet {
	
	private static String HOME = "/notes";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Check if logout is asked
		String logout = req.getParameter("logout");
		if(logout != null) {
			req.getSession().invalidate();
		}
		
		if(req.getSession().getAttribute("user") != null) {
			resp.sendRedirect(req.getContextPath()+HOME);
		}else {
			req.getRequestDispatcher("/WEB-INF/Connexion.jsp").forward(req, resp);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Get form request
		String login = req.getParameter("login");
		String password = req.getParameter("password");
		Map<String, String> feedback = new HashMap<String,String>();
		
		// Check for missing fields
		if(login == null || login.isEmpty()) {
			feedback.put("login","Merci d'entrer un login");
		}
		if(password == null || password.isEmpty()) {
			feedback.put("password","Merci d'entrer un mot de passe");
		}
		
		// Try to login if everything is ok
		if(feedback.isEmpty()) {
			Personne user;
			try {
				user = new PersonneBean().get(login);
				
				if(user.getId() != 0) {
					//User exists, check password
					if(Password.check(password, user.getHash())) {
						//Password correct, auth user in session
						req.getSession().setAttribute("user", user);
						resp.sendRedirect(req.getContextPath()+HOME);
						return;
					}else {
						feedback.put("login","Cette combinaison mot de passe login ne correspond à aucun compte, merci de réessayer");
					}
				}else {
					feedback.put("login","Cette combinaison mot de passe login ne correspond à aucun compte, merci de réessayer");
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//Send response
		req.setAttribute("feedback",feedback);
		req.getRequestDispatcher("/WEB-INF/Connexion.jsp").forward(req, resp);
	}
}
