package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PresenceBean implements Serializable{

	private static final long serialVersionUID = -4019634369177349239L;
	
	/* SELECT */
	public List<Presence> getAll() throws SQLException, ClassNotFoundException{
		
		List<Presence> presences = new ArrayList<Presence>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM presences");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Presence p = new Presence();
			p.setCours(new CoursBean().get(rs.getInt("id_cours")));
			p.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
			p.setPresent(rs.getBoolean("present_presence"));
			
			presences.add(p);
		}
		
		rs.close();
		ps.close();
		
		return presences;
	}
	
	public Presence get(Cours c,Personne p) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours WHERE id_cours = ? AND id_personne = ?");
		ps.setInt(1, c.getId());
		ps.setInt(2, p.getId());
		
		ResultSet rs = ps.executeQuery();
		Presence p2 = new Presence();
		while(rs.next()) {
			p2.setCours(new CoursBean().get(rs.getInt("id_cours")));
			p2.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
			p2.setPresent(rs.getBoolean("present_presence"));
		}
		
		rs.close();
		ps.close();
		
		return p2;
	}
	
	/* INSERT */
	public void insert(Presence p) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO presences VALUES (?,?,?)");
		ps.setInt(1, p.getCours().getId());
		ps.setInt(2, p.getPersonne().getId());
		ps.setBoolean(3, p.isPresent());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Presence p) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM presences WHERE id_cours = ? AND id_personne = ?");
		ps.setInt(1,p.getCours().getId());
		ps.setInt(2, p.getPersonne().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Presence p) throws SQLException, ClassNotFoundException {
		String query = "UPDATE presences SET "
				+ "present_presence = ? "
				+ "WHERE id_cours = ? AND id_personne = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setBoolean(1, p.isPresent());
		ps.setInt(2, p.getCours().getId());
		ps.setInt(3, p.getPersonne().getId());
		
		
		ps.executeUpdate();
		ps.close();
	}
	
}
