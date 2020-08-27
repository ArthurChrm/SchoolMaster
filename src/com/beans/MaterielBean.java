package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MaterielBean implements Serializable{

	private static final long serialVersionUID = 782696113973805318L;
	
	/* SELECT */
	public List<Materiel> getAll() throws SQLException, ClassNotFoundException{
		
		List<Materiel> materiels = new ArrayList<Materiel>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM materiel");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Materiel m = new Materiel();
			m.setId(rs.getInt("id_materiel"));
			m.setNom(rs.getString("nom_materiel"));
			
			materiels.add(m);
		}
		
		rs.close();
		ps.close();
		
		return materiels;
	}
	
	public List<Cours> getCours(Materiel m) throws ClassNotFoundException, SQLException{
		List<Cours> cours = new ArrayList<Cours>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours_materiel WHERE id_materiel = ?");
		ps.setInt(1, m.getId());
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			cours.add(new CoursBean().get(rs.getInt("id_cours")));
		}
		
		rs.close();
		ps.close();
		
		return cours;
	}
	
	public Materiel get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM materiel WHERE id_materiel = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Materiel m = new Materiel();
		while(rs.next()) {
			m.setId(id);
			m.setNom(rs.getString("nom_materiel"));
		}
		
		rs.close();
		ps.close();
		
		return m;
	}
	
	/* INSERT */
	public void insert(Materiel m) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO materiel VALUES (?,?)");
		ps.setInt(1, m.getId());
		ps.setString(2, m.getNom());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Materiel m) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM materiel WHERE id_materiel = ?");
		ps.setInt(1,m.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Materiel m) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("UPDATE materiel SET nom_materiel = ? WHERE id_materiel = ?");
		ps.setString(1,m.getNom());
		ps.setInt(2,m.getId());
		
		ps.executeUpdate();
		ps.close();
	}

}
