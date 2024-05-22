package sake;

public class reviewDTO {
	String review_name;
	String review_no;
	String review_star;
	String review_date;
	String review_title;
	String review_content;
	String review_quantity;
	String review_photo;
	
	public reviewDTO() {}
	public reviewDTO(String review_name, String review_no, String review_star, String review_date, String review_title, String review_content, String review_quantity, String review_photo) {
		this.review_name = review_name;
		this.review_no = review_no;
		this.review_star = review_star;
		this.review_date = review_date;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_quantity = review_quantity;
		this.review_photo = review_photo;
	}

	public String getReview_name() {
		return review_name;
	}

	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}

	public String getReview_no() {
		return review_no;
	}

	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getReview_star() {
		return review_star;
	}

	public void setReview_star(String review_star) {
		this.review_star = review_star;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public String getReview_title() {
		return review_title;
	}
	
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	
	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_quantity() {
		return review_quantity;
	}

	public void setReview_quantity(String review_quantity) {
		this.review_quantity = review_quantity;
	}
	
	public String getReview_photo() {
		return review_photo;
	}

	public void setReview_photo(String review_photo) {
		this.review_photo = review_photo;
	}


}
