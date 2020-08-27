package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CoursMaterielBean implements Serializable{

	private static final long serialVersionUID = -1393798069969851182L;

	/* SELECT */
	public List<CoursMateriel> getAll() throws SQLException, ClassNotFoundException{
		
		List<CoursMateriel> coursMateriel = new ArrayList<CoursMateriel>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours_materiel");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			CoursMateriel cm = new CoursMateriel();
			cm.setMateriel(new MaterielBean().get(rs.getInt("id_materiel")));
			cm.setCours(new CoursBean().get(rs.getInt("id_cours")));
			
			coursMateriel.add(cm);
		}
		
		rs.close();
		ps.close();
		
		return coursMateriel;
	}
	
public List<CoursMateriel> getAll(Cours c) throws SQLException, ClassNotFoundException{
		
		List<CoursMateriel> coursMateriel = new ArrayList<CoursMateriel>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours_materiel WHERE id_cours = ?");
		ps.setInt(1, c.getId());
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			CoursMateriel cm = new CoursMateriel();
			cm.setMateriel(new MaterielBean().get(rs.getInt("id_materiel")));
			cm.setCours(new CoursBean().get(rs.getInt("id_cours")));
			
			coursMateriel.add(cm);
		}
		
		rs.close();
		ps.close();
		
		return coursMateriel;
	}
	
	public CoursMateriel get(Materiel m,Cours c) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours_materiel WHERE id_materiel = ? AND id_cours = ?");
		ps.setInt(1, m.getId());
		ps.setInt(2, c.getId());
		
		ResultSet rs = ps.executeQuery();
		CoursMateriel cm = new CoursMateriel();
		while(rs.next()) {
			cm.setMateriel(new MaterielBean().get(rs.getInt("id_materiel")));
			cm.setCours(new CoursBean().get(rs.getInt("id_cours")));
		}
		
		rs.close();
		ps.close();
		
		return cm;
	}
	
	
	
	/* INSERT */
	public void insert(CoursMateriel cm) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO cours_materiel VALUES (?,?)");
		ps.setInt(1, cm.getMateriel().getId());
		ps.setInt(2, cm.getCours().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(CoursMateriel cm) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM cours_materiel WHERE id_materiel = ? AND id_cours = ?");
		ps.setInt(1,cm.getMateriel().getId());
		ps.setInt(2, cm.getCours().getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(CoursMateriel old_cm,CoursMateriel new_cm) throws SQLException, ClassNotFoundException {
		String query = "UPDATE cours_materiel SET "
				+ "id_materiel = ? "
				+ "id_cours = ? "
				+ "WHERE id_materiel = ? AND id_cours = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setInt(1, new_cm.getMateriel().getId());
		ps.setInt(2, new_cm.getCours().getId());
		ps.setInt(3, old_cm.getMateriel().getId());
		ps.setInt(4, old_cm.getCours().getId());
		
		ps.executeUpdate();
		ps.close();
	}
}
