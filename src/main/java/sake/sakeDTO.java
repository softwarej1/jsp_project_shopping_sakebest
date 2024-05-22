package sake;

public class sakeDTO {

	String sake_no, sake_name, sake_name_kr, sake_co, sake_loc, sake_dosu, sake_des, sake_img;
	int sake_price;
	
	
	public sakeDTO() {
	}


	public sakeDTO(String sake_no, String sake_name, String sake_name_kr, String sake_co, String sake_loc,
			String sake_dosu, String sake_des, String sake_img, int sake_price) {
		super();
		this.sake_no = sake_no;
		this.sake_name = sake_name;
		this.sake_name_kr = sake_name_kr;
		this.sake_co = sake_co;
		this.sake_loc = sake_loc;
		this.sake_dosu = sake_dosu;
		this.sake_des = sake_des;
		this.sake_img = sake_img;
		this.sake_price = sake_price;
	}


	public String getSake_no() {
		return sake_no;
	}


	public void setSake_no(String sake_no) {
		this.sake_no = sake_no;
	}


	public String getSake_name() {
		return sake_name;
	}


	public void setSake_name(String sake_name) {
		this.sake_name = sake_name;
	}


	public String getSake_name_kr() {
		return sake_name_kr;
	}


	public void setSake_name_kr(String sake_name_kr) {
		this.sake_name_kr = sake_name_kr;
	}


	public String getSake_co() {
		return sake_co;
	}


	public void setSake_co(String sake_co) {
		this.sake_co = sake_co;
	}


	public String getSake_loc() {
		return sake_loc;
	}


	public void setSake_loc(String sake_loc) {
		this.sake_loc = sake_loc;
	}


	public String getSake_dosu() {
		return sake_dosu;
	}


	public void setSake_dosu(String sake_dosu) {
		this.sake_dosu = sake_dosu;
	}


	public String getSake_des() {
		return sake_des;
	}


	public void setSake_des(String sake_des) {
		this.sake_des = sake_des;
	}
	
	public String getSake_img() {
		return sake_img;
	}
	
	
	public void setSake_img(String sake_img) {
		this.sake_img = sake_img;
	}

	public int getSake_price() {
		return sake_price;
	}


	public void setSake_price(int sake_price) {
		this.sake_price = sake_price;
	}
	
	
	
	
}
