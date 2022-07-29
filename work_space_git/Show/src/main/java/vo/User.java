package vo;

public class User {
	private String user_id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String addr;
	private String role;

	public User() {
		super();
	}

	public User(String user_id, String pw, String name, String phone, String email, String addr, String role) {
		super();
		this.user_id = user_id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.addr = addr;
		this.role = role;
	}

	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", email=" + email
				+ ", addr=" + addr + ", role=" + role + "]";
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}
