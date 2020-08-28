package com.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.auth.Roles;
import com.beans.Note;
import com.beans.NoteBean;
import com.beans.Personne;
import com.beans.PersonneBean;

public class Notes extends HttpServlet {

	private static List<Roles> autorized = Arrays.asList(Roles.ADMIN,Roles.DIRECTEUR,Roles.PROF);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//Redirect if not logged
		if(req.getSession().getAttribute("user") == null) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		//Redirect if not authorized
		Personne user = (Personne) req.getSession().getAttribute("user");
		if(!autorized.contains(user.getRole().getEnum())) {resp.sendRedirect(req.getContextPath()+"/home"); return;}
		
		
		try {
			//Load students
			List<Personne> eleves = new PersonneBean().getAll(Roles.ELEVE);
			req.setAttribute("eleves", eleves);
			
			//Load notes
			Map<String,List<Note>> elevesNotes = new HashMap<>();
			for(Personne p : eleves) {
				List<Note> notes = new NoteBean().getAll(p);
				elevesNotes.put(p.getLogin(),notes);
			}
			
			req.setAttribute("notes", elevesNotes);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/Notes.jsp").forward(req, resp);
	}

}
