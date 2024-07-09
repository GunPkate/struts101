package action;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import connection.ConnectionDB;
import model.Product;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import action.BaseAction;
import java.util.Map;

public class LoadProduct extends BaseAction {

	public static List<Product> productList = null;
	private Map<String,Object> jsonData = new HashMap<String,Object>();
	String searchInput = "";
	
	public String execute() throws ClassNotFoundException, SQLException {
		
		try{		
			Connection conn = ConnectionDB.DB();
			productList = queryProduct(conn,"");
			conn.close();
			
		} catch (Exception e) {
		    System.out.println("Error " + e.getMessage());
		}
		
		return "success";
	}
	
	public String filterProduct() throws ClassNotFoundException, SQLException {
		try {
			HttpServletRequest req = getRequestServ();
			String[] input = req.getParameterValues("searchInput");
			Connection conn = ConnectionDB.DB();
			productList = queryProduct(conn,input[0]);
			jsonData.put("filterProduct", productList);

			conn.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "success";
	}

	private List<Product> queryProduct(Connection conn,String queryInput) throws SQLException {
		
		String query = "select p.id, p.name, pd.description, pd.rating, pd.price  from product p\r\n"
				+ "left join product_detail pd \r\n"
				+ "on pd.product_code = p.id ";
		if(!queryInput.equals("") || !queryInput.isBlank()) {
			query += "where p.name like '%"+ queryInput + "%' ";
		}
		
		Statement statement =  conn.createStatement();
		ResultSet resultSet = statement.executeQuery(query);
//	


		ArrayList<Product> temp = new ArrayList<Product>();
		while (resultSet.next())
		{
			Product productItem = new Product();
			productItem.setId(resultSet.getString("id")); 
		    productItem.setName(resultSet.getString("name")); 
		    productItem.setDesc(resultSet.getString("description"));
		    productItem.setRating(resultSet.getFloat("rating"));
		    productItem.setPrice(resultSet.getFloat("price"));
		    temp.add(productItem);
		}
		return temp;
		
	}

	public List<Product> getProductList() {
		return productList;
	}



	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	public String getSearchInput() {
		return searchInput;
	}

	public void setSearchInput(String searchInput) {
		this.searchInput = searchInput;
	}

	public Map<String, Object> getJsonData() {
		return jsonData;
	}

	public void setJsonData(Map<String, Object> jsonData) {
		this.jsonData = jsonData;
	}
	
	
	
}
