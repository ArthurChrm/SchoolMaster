package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoursBean implements Serializable{

	private static final long serialVersionUID = -1779404114296624381L;
	
	/* SELECT */
	public List<Cours> getAll() throws SQLException, ClassNotFoundException{
		
		List<Cours> cours = new ArrayList<Cours>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Cours c = new Cours();
			c.setId(rs.getInt("id_cours"));
			c.setDebut(rs.getDate("debut_cours"));
			c.setFin(rs.getDate("fin_cours"));
			c.setClasse(new ClasseBean().get(rs.getInt("id_classe")));
			c.setSalle(new SalleBean().get(rs.getInt("id_salle")));
			
			cours.add(c);
		}
		
		rs.close();
		ps.close();
		
		return cours;
	}
	
	public Cours get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours WHERE id_cours = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Cours c = new Cours();
		while(rs.next()) {
			c.setId(rs.getInt("id_cours"));
			c.setDebut(rs.getDate("debut_cours"));
			c.setFin(rs.getDate("fin_cours"));
			c.setClasse(new ClasseBean().get(rs.getInt("id_classe")));
			c.setSalle(new SalleBean().get(rs.getInt("id_salle")));
		}
		
		rs.close();
		ps.close();
		
		return c;
	}
	
	/* INSERT */
	public void insert(Cours c) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO cours VALUES (?,?,?,?,?)");
		ps.setInt(1, c.getId());
		ps.setDate(2, c.getDebut());
		ps.setDate(3, c.getFin());
		ps.setInt(4, c.getClasse().getId());
		ps.setInt(5, c.getSalle().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Cours c) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM cours WHERE id_cours = ?");
		ps.setInt(1,c.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Cours c) throws SQLException, ClassNotFoundException {
		String query = "UPDATE cours SET "
				+ "debut_cours = ? "
				+ "fin_cours = ?"
				+ "id_classe = ? "
				+ "id_salle = ? "
				+ "WHERE id_cours = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setDate(1, c.getDebut());
		ps.setDate(2, c.getFin());
		ps.setInt(3, c.getClasse().getId());
		ps.setInt(4, c.getSalle().getId());
		ps.setInt(5, c.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
}
