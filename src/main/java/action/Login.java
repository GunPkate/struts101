package action;

public class Login {
	private static String user;
	private static String password;
	
	public static String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public static String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute(){  
		String result = "failed";
		String userInput = getUser();
		String passwordInput = getPassword();
		
		if(userInput.equals("123") && passwordInput.equals("123") ) {
			result = "success";  
		}
	    return result;  
	}  
}
