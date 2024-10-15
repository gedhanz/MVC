package AcornStay;

public class AcornStayUserDTO {
	String user_id;
	String password;
	String name;
	String date;
	String phone;
	String nickname;
	public AcornStayUserDTO(String user_id, String password, String name, String date, String phone, String nickname) {
		super();
		this.user_id = user_id;
		this.password = password;
		this.name = name;
		this.date = date;
		this.phone = phone;
		this.nickname = nickname;
	}
	public AcornStayUserDTO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "AcornStayUserDTO [user_id=" + user_id + ", password=" + password + ", name=" + name + ", date=" + date
				+ ", phone=" + phone + ", nickname=" + nickname + "]";
	}
	public String getUser_id() {
		return user_id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getDate() {
		return date;
	}
	public String getPhone() {
		return phone;
	}
	public String getNickname() {
		return nickname;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
}
