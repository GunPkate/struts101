package action;

import java.sql.Statement;

import connection.ConnectionDB;
import model.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoadProduct extends BaseAction {

	Product product = new Product();
	
	String query = "select p.name, pd.description, pd.rating, pd.price  from product p\r\n"
			+ "left join product_detail pd \r\n"
			+ "on pd.product_code = p.id ";
	
	public String execute() throws ClassNotFoundException, SQLException {
		Connection conn = ConnectionDB.DB();
		Statement statement =  conn.createStatement();
		ResultSet resultSet = statement.executeQuery(query);
	
		while (resultSet.next())
		{
		    String columnValue = resultSet.getString("column_name");
		    System.out.println("Column Value: " + columnValue);
		}
		
		return "Success";
	}
}
