package AcornStay;

public class AcornStayAccommodationDTO {
	int id;
	String region;
	String detail_location;
	int price;
	float rate;
	int max_occupancy;
	String name;
	String image;
	
	
	public AcornStayAccommodationDTO() {
		// TODO Auto-generated constructor stub
	}

	public AcornStayAccommodationDTO(int id, String region, String detail_location, int price, float rate,
			int max_occupancy, String name, String image) {
		super();
		this.id = id;
		this.region = region;
		this.detail_location = detail_location;
		this.price = price;
		this.rate = rate;
		this.max_occupancy = max_occupancy;
		this.image = image;
		this.name = name;
	}

	@Override
	public String toString() {
		return "AcornStayAccommodationDTO [id=" + id + ", region=" + region + ", detail_location=" + detail_location
				+ ", price=" + price + ", rate=" + rate + ", max_occupancy=" + max_occupancy + ", image=" + image
				+ ", name=" + name + "]";
	}

	public int getId() {
		return id;
	}

	public String getRegion() {
		return region;
	}

	public String getDetail_location() {
		return detail_location;
	}

	public int getPrice() {
		return price;
	}

	public float getRate() {
		return rate;
	}

	public int getMax_occupancy() {
		return max_occupancy;
	}

	public String getImage() {
		return image;
	}

	public String getName() {
		return name;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public void setDetail_location(String detail_location) {
		this.detail_location = detail_location;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public void setRate(float rate) {
		this.rate = rate;
	}

	public void setMax_occupancy(int max_occupancy) {
		this.max_occupancy = max_occupancy;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
