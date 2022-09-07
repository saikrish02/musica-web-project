package com.musica.db.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.musica.web.model.Product;


public class Productsdbdao {
	
	public ArrayList<Product> getAllProducts() throws ClassNotFoundException, SQLException {
		String query = "SELECT * FROM PRODUCTSDATA";
		
		Userdbdao db = new Userdbdao();
		Connection con = db.getConnection();
		Statement st = con.createStatement();
		ResultSet r = st.executeQuery(query);
		
		ArrayList<Product> products = new ArrayList<Product>();
		
		while(r.next()) {
			int pid = r.getInt(1);
			String name = r.getString(2);
			int price = r.getInt(3);
			String category = r.getString(4);
			String desc = r.getString(5);
			
			Product p = new Product(pid, name, price, category, desc);
			products.add(p);
		}
	
		return products;
	}
	

	public ArrayList<Product> getProductsByCategory(String name) throws ClassNotFoundException, SQLException {
			
			ArrayList<Product> allProducts = this.getAllProducts();
			ArrayList<Product> products = new ArrayList<Product>();
			
			int i=0;
			
			for(Product p: allProducts ) {
				if(p.getCategory().equals(name)) {
					products.add(i, p);
				}
			}
			return products;
		}
}
