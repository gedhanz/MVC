package AcornStay;

public class AcornStayReservationDTO {
	int id;
	int accommodation_id;
	String user_id;
	String nickname;
	String check_in;
	String check_out;
	int price;
	int number_of_people;
	
	public AcornStayReservationDTO() {
		// TODO Auto-generated constructor stub
	}

	public AcornStayReservationDTO(int id, int accommodation_id, String user_id, String nickname, String check_in,
			String check_out, int price, int number_of_people) {
		super();
		this.id = id;
		this.accommodation_id = accommodation_id;
		this.user_id = user_id;
		this.nickname = nickname;
		this.check_in = check_in;
		this.check_out = check_out;
		this.price = price;
		this.number_of_people = number_of_people;
	}

	@Override
	public String toString() {
		return "AcornStayReservationDTO [id=" + id + ", accommodation_id=" + accommodation_id + ", user_id=" + user_id
				+ ", nickname=" + nickname + ", check_in=" + check_in + ", check_out=" + check_out + ", price=" + price
				+ ", number_of_people=" + number_of_people + "]";
	}

	public int getId() {
		return id;
	}

	public int getAccommodation_id() {
		return accommodation_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public String getNickname() {
		return nickname;
	}

	public String getCheck_in() {
		return check_in;
	}

	public String getCheck_out() {
		return check_out;
	}

	public int getPrice() {
		return price;
	}

	public int getNumber_of_people() {
		return number_of_people;
	}
	
	
}
