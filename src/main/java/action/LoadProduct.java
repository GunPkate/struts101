package action;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import connection.ConnectionDB;
import model.Product;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoadProduct extends BaseAction {

	List<Product> productList = null;
	

	String query = "select p.name, pd.description, pd.rating, pd.price  from product p\r\n"
			+ "left join product_detail pd \r\n"
			+ "on pd.product_code = p.id ";
	
	
	
	public String execute() throws ClassNotFoundException, SQLException {
		
		try{		
			Product product = new Product();
			Connection conn = ConnectionDB.DB();
			Statement statement =  conn.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
//		

//			if(!productName.equals("")) {
//				query += "where p.name like '"+ productName + "' ";
//			}
			
			ArrayList<Product> temp = new ArrayList();
			while (resultSet.next())
			{
				Product productItem = new Product();
			    productItem.setName(resultSet.getString("name")); 
			    productItem.setDesc(resultSet.getString("description"));
			    productItem.setRating(resultSet.getFloat("rating"));
			    productItem.setPrice(resultSet.getFloat("price"));
			    temp.add(productItem);
			}
			productList = temp;

			
		} catch (Exception e) {
		    System.out.println("Error " + e.getMessage());
		}
		
		return "success";
	}



	public List<Product> getProductList() {
		return productList;
	}



	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}



	
}
