package sake;

public class userDTO {
	String user_id, user_pwd, user_name, user_phone, user_addr, user_cart, user_favorite, user_birth;

	public userDTO() {

	}

	public userDTO(String user_id, String user_pwd, String user_name, String user_birth, String user_phone, String user_addr,
			String user_cart, String user_favorite) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_birth = user_birth;
		this.user_phone = user_phone;
		this.user_addr = user_addr;
		this.user_cart = user_cart;
		this.user_favorite = user_favorite;
	}


	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	public String getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_cart() {
		return user_cart;
	}

	public void setUser_cart(String user_cart) {
		this.user_cart = user_cart;
	}

	public String getUser_favorite() {
		return user_favorite;
	}

	public void setUser_favorite(String user_favorite) {
		this.user_favorite = user_favorite;
	}
	
	

}
