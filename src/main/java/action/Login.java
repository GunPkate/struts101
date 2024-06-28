package action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import constants.EcomConstant;
import constants.EcomConstant.Role;
import model.Product;
import model.SessionProfile;
import action.BaseAction;
import connection.ConnectionDB;
import constants.EcomConstant;

public class Login extends BaseAction {
	private  String user;
	private  String password;
//	private Map< String, Object> session  ;
	public  String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public  String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@SuppressWarnings("unchecked")
	public String execute() throws ClassNotFoundException, SQLException{  
		String result = "failed";
		String userInput = getUser();
		String passwordInput = getPassword();
		String query = "select * from customer;";
		
		user = userInput;
		
		Connection conn = ConnectionDB.DB();
		Statement statement =  conn.createStatement();
		ResultSet resultSet = statement.executeQuery(query);
	
		while (resultSet.next())
		{
		    String cId = resultSet.getString("id");
		    String cName = resultSet.getString("name");
		    String cPass = resultSet.getString("password");

			if( userInput.equals(cName) && passwordInput.equals(cPass) ) {
				Role.ROLE_MANAGER.getRole();
				session.put("role", userInput);
//				sessionProfile.setRole( (String)EcomConstant.Role.ROLE_MANAGER);
//				sessionProfile.setUserName(userInput);
				result = "success";  
			}
		}
		
		SessionProfile sessionProfile = new SessionProfile();

	    return result;  
	}  
}
