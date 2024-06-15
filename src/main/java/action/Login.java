package action;

import java.util.Map;

import com.opensymphony.xwork2.ActionSupport;

import constants.EcomConstant;
import constants.EcomConstant.Role;
import model.SessionProfile;
import action.BaseAction;
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
	public String execute(){  
		String result = "failed";
		String userInput = getUser();
		String passwordInput = getPassword();
		
		user = userInput;
		
		SessionProfile sessionProfile = new SessionProfile();
		if( userInput.equals("gunp") && passwordInput.equals("123") ) {
			Role.ROLE_MANAGER.getRole();
			session.put("role", userInput);
//			sessionProfile.setRole( (String)EcomConstant.Role.ROLE_MANAGER);
//			sessionProfile.setUserName(userInput);
			result = "success";  
		}
	    return result;  
	}  
}
