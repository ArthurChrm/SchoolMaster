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
			c.setIntitule(rs.getString("intitule_cours"));
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
			c.setIntitule(rs.getString("intitule_cours"));
			c.setClasse(new ClasseBean().get(rs.getInt("id_classe")));
			c.setSalle(new SalleBean().get(rs.getInt("id_salle")));
		}
		
		rs.close();
		ps.close();
		
		return c;
	}
	
	public List<Materiel> getMateriel(Cours c) throws ClassNotFoundException, SQLException{
		List<Materiel> materiels = new ArrayList<Materiel>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM cours_materiel WHERE id_cours = ?");
		ps.setInt(1, c.getId());
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			materiels.add(new MaterielBean().get(rs.getInt("id_materiel")));
		}
		
		rs.close();
		ps.close();
		
		return materiels;
	}
	
	public List<Personne> getPersonnes(Cours c) throws ClassNotFoundException, SQLException{
		List<Personne> personnes = new ArrayList<Personne>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM presences WHERE id_cours = ?");
		ps.setInt(1, c.getId());
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			personnes.add(new PersonneBean().get(rs.getInt("id_personne")));
		}
		
		rs.close();
		ps.close();
		
		return personnes;
	}
	
	/* INSERT */
	public void insert(Cours c) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO cours(debut_cours,fin_cours,id_classe,id_salle,intitule_cours) VALUES (?,?,?,?,?)");
		ps.setDate(1, c.getDebut());
		ps.setDate(2, c.getFin());
		ps.setInt(3, c.getClasse().getId());
		ps.setInt(4, c.getSalle().getId());
		ps.setInt(5, c.getIntitule());
		
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
				+ "debut_cours = ?, "
				+ "fin_cours = ?, "
				+ "id_classe = ?, "
				+ "id_salle = ?, "
				+ "intitule_cours = ? "
				+ "WHERE id_cours = ?";
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement(query);
		ps.setDate(1, c.getDebut());
		ps.setDate(2, c.getFin());
		ps.setInt(3, c.getClasse().getId());
		ps.setInt(4, c.getSalle().getId());
		ps.setString(5, c.getIntitule());
		ps.setInt(6, c.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
}
