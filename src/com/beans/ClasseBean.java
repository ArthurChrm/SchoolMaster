package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClasseBean implements Serializable{
	
	private static final long serialVersionUID = 6717010781513088826L;
	
	/* SELECT */
	public List<Classe> getAll() throws SQLException, ClassNotFoundException{
		
		List<Classe> classes = new ArrayList<Classe>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM classes");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Classe c = new Classe();
			c.setId(rs.getInt("id_classe"));
			c.setNiveau(rs.getString("niveau_classe"));
			
			classes.add(c);
		}
		
		rs.close();
		ps.close();
		
		return classes;
	}
	
	public Classe get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM classes WHERE id_classe = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Classe c = new Classe();
		while(rs.next()) {
			c.setId(rs.getInt("id_classe"));
			c.setNiveau(rs.getString("niveau_classe"));
		}
		
		rs.close();
		ps.close();
		
		return c;
	}
	
	/* INSERT */
	public void insert(Classe c) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO classes VALUES (?,?)");
		ps.setInt(1, c.getId());
		ps.setString(2, c.getNiveau());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Classe c) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM classes WHERE id_classe = ?");
		ps.setInt(1,c.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Classe c) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("UPDATE classes SET niveau_classe = ? WHERE id_classe = ?");
		ps.setString(1,c.getNiveau());
		ps.setInt(2,c.getId());
		
		ps.executeUpdate();
		ps.close();
	}

}
