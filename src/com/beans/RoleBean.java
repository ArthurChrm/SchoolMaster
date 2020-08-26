package com.beans;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoleBean implements Serializable{
	
	private static final long serialVersionUID = 2062512111290298053L;
	
	/* SELECT */
	public List<Role> getAll() throws SQLException, ClassNotFoundException{
		
		List<Role> roles = new ArrayList<Role>();
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM roles");
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			Role r = new Role();
			r.setId(rs.getInt("id_role"));
			r.setNom(rs.getString("nom_role"));
			
			roles.add(r);
		}
		
		rs.close();
		ps.close();
		
		return roles;
	}
	
	public Role get(int id) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("SELECT * FROM roles WHERE id_role = ?");
		ps.setInt(1, id);
		
		ResultSet rs = ps.executeQuery();
		Role r = new Role();
		while(rs.next()) {
			r.setId(id);
			r.setNom(rs.getString("nom_role"));
		}
		
		rs.close();
		ps.close();
		
		return r;
	}
	
	/* INSERT */
	public void insert(Role r) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("INSERT INTO roles VALUES (?,?)");
		ps.setInt(1, r.getId());
		ps.setString(2, r.getNom());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* DELETE */
	public void delete(Role r) throws ClassNotFoundException, SQLException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("DELETE FROM roles WHERE id_role = ?");
		ps.setInt(1,r.getId());
		
		ps.executeUpdate();
		ps.close();
	}
	
	/* UPDATE */
	public void update(Role r) throws SQLException, ClassNotFoundException {
		PreparedStatement ps = BDD.getInstance().getConn().prepareStatement("UPDATE roles SET nom_role = ? WHERE id_role = ?");
		ps.setString(1,r.getNom());
		ps.setInt(2,r.getId());
		
		ps.executeUpdate();
		ps.close();
	}

}
