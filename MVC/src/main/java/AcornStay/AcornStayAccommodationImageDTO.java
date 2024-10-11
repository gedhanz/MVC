package AcornStay;

public class AcornStayAccommodationImageDTO {
	int id;
	int accommodation_id;
	String image_path;
	
	public AcornStayAccommodationImageDTO() {
		// TODO Auto-generated constructor stub
	}

	public AcornStayAccommodationImageDTO(int id, int accommodation_id, String image_path) {
		super();
		this.id = id;
		this.accommodation_id = accommodation_id;
		this.image_path = image_path;
	}

	public int getId() {
		return id;
	}

	public int getAccommodation_id() {
		return accommodation_id;
	}

	public String getImage_path() {
		return image_path;
	}

	@Override
	public String toString() {
		return "AcornStayAccommodationImageDTO [id=" + id + ", accommodation_id=" + accommodation_id + ", image_path="
				+ image_path + "]";
	}
	
	
}
