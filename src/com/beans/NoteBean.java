package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoteBean implements Serializable{
	
	private static final long serialVersionUID = 5276104163681954115L;
	
	/* SELECT */
	public List<Note> getAll() throws SQLException, ClassNotFoundException{
		
		List<Note> notes = new ArrayList<Note>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM notes");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Note n = new Note();
			n.setId(rs.getInt("id_note"));
			n.setValeur(rs.getFloat("valeur_note"));
			n.setDescription(rs.getString("description_note"));
			n.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
			
			notes.add(n);
		}
		
		rs.close();
		ps.close();
		
		return notes;
	}
	
	public List<Note> getAll(Personne p) throws SQLException, ClassNotFoundException{
		
		List<Note> notes = new ArrayList<Note>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM notes WHERE id_personne = ?");
		ps.setInt(1, p.getId());
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Note n = new Note();
			n.setId(rs.getInt("id_note"));
			n.setValeur(rs.getFloat("valeur_note"));
			n.setDescription(rs.getString("description_note"));
			n.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
			
			notes.add(n);
		}
		
		rs.close();
		ps.close();
		
		return notes;
	}
	
	public Note get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM notes WHERE id_note = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Note n = new Note();
		while(rs.next()) {
			n.setId(rs.getInt("id_note"));
			n.setValeur(rs.getFloat("valeur_note"));
			n.setDescription(rs.getString("description_note"));
			n.setPersonne(new PersonneBean().get(rs.getInt("id_personne")));
		}
		
		rs.close();
		ps.close();
		
		return n;
	}
	
	/* INSERT */
	public void insert(Note n) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO notes VALUES (?,?,?,?)");
		ps.setInt(1, n.getId());
		ps.setFloat(2, n.getValeur());
		ps.setString(3, n.getDescription());
		ps.setInt(4, n.getPersonne().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Note n) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM notes WHERE id_note = ?");
		ps.setInt(1,n.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Note n) throws SQLException, ClassNotFoundException {
		String query = "UPDATE notes SET "
				+ "valeur_note = ? "
				+ "description_note = ?"
				+ "id_personne = ?"
				+ "WHERE id_note = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setInt(1, n.getId());
		ps.setFloat(2, n.getValeur());
		ps.setString(3, n.getDescription());
		ps.setInt(4, n.getPersonne().getId());
		
		ps.executeUpdate();
		ps.close();
	}
}
