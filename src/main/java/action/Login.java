package action;

import com.opensymphony.xwork2.ActionSupport;

import constants.EcomConstant;
import constants.EcomConstant.Role;
import model.SessionProfile;

public class Login extends ActionSupport {
	private  String user;
	private  String password;
	
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

	public String execute(){  
		String result = "failed";
		String userInput = getUser();
		String passwordInput = getPassword();
		
		user = userInput;
		
		SessionProfile sessionProfile = new SessionProfile();
		if( userInput.equals("gunp") && passwordInput.equals("123") ) {
//			sessionProfile.setRole( (String)EcomConstant.Role.ROLE_MANAGER);
			sessionProfile.setUserName(userInput);
			result = "success";  
		}
	    return result;  
	}  
}
