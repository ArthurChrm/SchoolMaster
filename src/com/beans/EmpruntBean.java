package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpruntBean implements Serializable{

	private static final long serialVersionUID = -502645944696070563L;
	
	/* SELECT */
	public List<Emprunt> getAll() throws SQLException, ClassNotFoundException{
		
		List<Emprunt> emprunts = new ArrayList<Emprunt>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM emprunts");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Emprunt e = new Emprunt();
			e.setId(rs.getInt("id_emprunt"));
			e.setIsbn(rs.getInt("isbn_emprunt"));
			e.setDebut(rs.getDate("debut_emprunt"));
			e.setFin(rs.getDate("fin_emprunt"));
			e.setRendu(rs.getBoolean("rendu_emprunt"));
			e.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
			
			emprunts.add(e);
		}
		
		rs.close();
		ps.close();
		
		return emprunts;
	}
	
	public Emprunt get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM emprunts WHERE id_emprunt = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Emprunt e = new Emprunt();
		while(rs.next()) {
			e.setId(rs.getInt("id_emprunt"));
			e.setIsbn(rs.getInt("isbn_emprunt"));
			e.setDebut(rs.getDate("debut_emprunt"));
			e.setFin(rs.getDate("fin_emprunt"));
			e.setRendu(rs.getBoolean("rendu_emprunt"));
			e.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
		}
		
		rs.close();
		ps.close();
		
		return e;
	}
	
	/* INSERT */
	public void insert(Emprunt e) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO emprunts VALUES (?,?,?,?,?,?)");
		ps.setInt(1, e.getId());
		ps.setInt(2, e.getIsbn());
		ps.setDate(3, e.getDebut());
		ps.setDate(4, e.getFin());
		ps.setBoolean(5, e.isRendu());
		ps.setInt(6, e.getPersonne().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Emprunt e) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM emprunts WHERE id_emprunt = ?");
		ps.setInt(1,e.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Emprunt e) throws SQLException, ClassNotFoundException {
		String query = "UPDATE emprunts SET "
				+ "isbn_emprunt = ? "
				+ "debut_emprunt = ?"
				+ "fin_emprunt = ? "
				+ "rendu_emprunt = ? "
				+ "id_personne = ? "
				+ "WHERE id_emprunt = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setInt(1, e.getIsbn());
		ps.setDate(2, e.getDebut());
		ps.setDate(3, e.getFin());
		ps.setBoolean(4, e.isRendu());
		ps.setInt(5, e.getPersonne().getId());
		ps.setInt(6, e.getId());
		
		ps.executeUpdate();
		ps.close();
	}

}
