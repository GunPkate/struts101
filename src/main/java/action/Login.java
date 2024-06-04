package action;

import com.opensymphony.xwork2.ActionSupport;

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
		
		if( userInput.equals("gunp") && passwordInput.equals("123") ) {
			result = "success";  
		}
	    return result;  
	}  
}
