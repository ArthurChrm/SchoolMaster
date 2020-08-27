package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SalleBean implements Serializable{

	private static final long serialVersionUID = -4735676664051694737L;
	
	/* SELECT */
	public List<Salle> getAll() throws SQLException, ClassNotFoundException{
		
		List<Salle> salles = new ArrayList<Salle>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM salles");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Salle s = new Salle();
			s.setId(rs.getInt("id_salle"));
			s.setNom(rs.getString("nom_salle"));
			
			salles.add(s);
		}
		
		rs.close();
		ps.close();
		
		return salles;
	}
	
	public Salle get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM salles WHERE id_salle = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Salle s = new Salle();
		while(rs.next()) {
			s.setId(id);
			s.setNom(rs.getString("nom_salle"));
		}
		
		rs.close();
		ps.close();
		
		return s;
	}
	
	/* INSERT */
	public void insert(Salle s) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO salles VALUES (?,?)");
		ps.setInt(1, s.getId());
		ps.setString(2, s.getNom());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Salle s) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM salles WHERE id_salle = ?");
		ps.setInt(1,s.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Salle s) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("UPDATE salles SET nom_salle = ? WHERE id_salle = ?");
		ps.setString(1,s.getNom());
		ps.setInt(2,s.getId());
		
		ps.executeUpdate();
		ps.close();
	}

}
