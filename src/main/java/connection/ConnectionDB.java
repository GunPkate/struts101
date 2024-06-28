package connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {

	public static Connection DB() throws SQLException, ClassNotFoundException {
			 
	        String jdbcUrl = "jdbc:postgresql://localhost:5432/j_servlet_test_db";
	        String username = "root";
	        String password = "root";


	        // Register the PostgreSQL driver

	        Class.forName("org.postgresql.Driver");
	        Connection conn = null;
	        // Connect to the database
			try {
			    conn = DriverManager.getConnection(jdbcUrl, username, password);
			    return conn;
			} catch (SQLException e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
				return null;
			}



	        // Perform desired database operations

	        // Close the connection
//	        conn.close();

	}
	
}	

