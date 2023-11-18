package Student;

import java.sql.Date;

public class Student
{

	//FOR BASIC INFORMATION
	String fname,mname,lname,course,street,area,city,state;
	Date dob;
	int pincode;
	
	//FOR ACADEMIC AND GRADUATION DETAILS
	String qualification,stream,iname,board,passingyr;
	float percentage;
	
	//FOR PROJECT DETAILS
	String ptitle,platform,duration,description;
	
	//FOR PERSONAL INFORMATION
	String lang,extra;
	

	public Student() 
	{
		// TODO Auto-generated constructor stub
	}


	public String getFname() {
		return fname;
	}


	public void setFname(String fname) {
		this.fname = fname;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getLname() {
		return lname;
	}


	public void setLname(String lname) {
		this.lname = lname;
	}


	public String getCourse() {
		return course;
	}


	public void setCourse(String course) {
		this.course = course;
	}


	public String getStreet() {
		return street;
	}


	public void setStreet(String street) {
		this.street = street;
	}


	public String getArea() {
		return area;
	}


	public void setArea(String area) {
		this.area = area;
	}


	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public Date getDob() {
		return dob;
	}


	public void setDob(Date dob) {
		this.dob = dob;
	}

	public int getPincode() {
		return pincode;
	}


	public void setPincode(int pincode) {
		this.pincode = pincode;
	}


	public String getQualification() {
		return qualification;
	}


	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public String getStream() {
		return stream;
	}


	public void setStream(String stream) {
		this.stream = stream;
	}


	public String getIname() {
		return iname;
	}


	public void setIname(String iname) {
		this.iname = iname;
	}


	public String getBoard() {
		return board;
	}


	public void setBoard(String board) {
		this.board = board;
	}


	public String getPassingyr() {
		return passingyr;
	}


	public void setPassingyr(String passingyr) {
		this.passingyr = passingyr;
	}


	public float getPercentage() {
		return percentage;
	}


	public void setPercentage(float percentage) {
		this.percentage = percentage;
	}


	public String getPtitle() {
		return ptitle;
	}


	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}


	public String getPlatform() {
		return platform;
	}


	public void setPlatform(String platform) {
		this.platform = platform;
	}


	public String getDuration() {
		return duration;
	}


	public void setDuration(String duration) {
		this.duration = duration;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getLang() {
		return lang;
	}


	public void setLang(String lang) {
		this.lang = lang;
	}


	public String getExtra() {
		return extra;
	}


	public void setExtra(String extra) {
		this.extra = extra;
	}


	public Student(String fname, String mname, String lname, String course,
			String street, String area, String city, String state, Date dob, int pincode, String qualification, String stream,
			String iname, String board, String passingyr, float percentage,
			String ptitle, String platform, String duration,
			String description, String lang, String extra) {
		super();
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.course = course;
		this.street = street;
		this.area = area;
		this.city = city;
		this.state = state;
		this.dob = dob;
		this.pincode = pincode;
		this.qualification = qualification;
		this.stream = stream;
		this.iname = iname;
		this.board = board;
		this.passingyr = passingyr;
		this.percentage = percentage;
		this.ptitle = ptitle;
		this.platform = platform;
		this.duration = duration;
		this.description = description;
		this.lang = lang;
		this.extra = extra;
	}


	@Override
	public String toString() {
		return "Student [fname=" + fname + ", mname=" + mname + ", lname="
				+ lname + ", course=" + course + ", street=" + street
				+ ", area=" + area + ", city=" + city + ", state=" + state
				+ ", dob=" + dob + ", pincode=" + pincode + ", qualification="
				+ qualification + ", stream=" + stream + ", iname=" + iname
				+ ", board=" + board + ", passingyr=" + passingyr
				+ ", percentage=" + percentage + ", ptitle=" + ptitle
				+ ", platform=" + platform + ", duration=" + duration
				+ ", description=" + description + ", lang=" + lang
				+ ", extra=" + extra + "]";
	}


	


	

	
	
	
}
