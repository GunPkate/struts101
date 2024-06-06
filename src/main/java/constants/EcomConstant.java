package constants;

public class EcomConstant {

	public enum Role{
		ROLE_STAFF("Staff"),
		ROLE_MANAGER("Manager");
		
		private String role;
		
		Role(String role) {
			this.role = role;
		}

		public String getRole() {
			return role;
		}
	}
}
