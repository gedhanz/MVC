package AcornStay;

public class AcornStayReviewDTO {
	int id;
	String nickname;
	int accommodation_id;
	String review_date;
	int rating;
	String review_text;
	public AcornStayReviewDTO(int id, String nickname, int accommodation_id, String review_date, int rating,
			String review_text) {
		super();
		this.id = id;
		this.nickname = nickname;
		this.accommodation_id = accommodation_id;
		this.review_date = review_date;
		this.rating = rating;
		this.review_text = review_text;
	}
	
	public AcornStayReviewDTO() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "AcornStayReviewDTO [id=" + id + ", nickname=" + nickname + ", accommodation_id=" + accommodation_id
				+ ", review_date=" + review_date + ", rating=" + rating + ", review_text=" + review_text + "]";
	}

	public int getId() {
		return id;
	}

	public String getNickname() {
		return nickname;
	}

	public int getAccommodation_id() {
		return accommodation_id;
	}

	public String getReview_date() {
		return review_date;
	}

	public int getRating() {
		return rating;
	}

	public String getReview_text() {
		return review_text;
	}
	
	
}
