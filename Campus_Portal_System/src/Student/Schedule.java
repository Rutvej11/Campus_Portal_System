package Student;

import java.sql.Date;

public class Schedule {

	int cid,pincode;
	String cname,cdoamin,street,area,city,state,cdesc,email,job,venue,timeinfo;
	double salary;
	Date d;
	
	
	public Schedule()
	{
		// TODO Auto-generated constructor stub
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getCname() {
		return cname;
	}


	public void setCname(String cname) {
		this.cname = cname;
	}


	public String getCdoamin() {
		return cdoamin;
	}


	public void setCdoamin(String cdoamin) {
		this.cdoamin = cdoamin;
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


	public String getCdesc() {
		return cdesc;
	}


	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getVenue() {
		return venue;
	}


	public void setVenue(String venue) {
		this.venue = venue;
	}


	public String getTimeinfo() {
		return timeinfo;
	}


	public void setTimeinfo(String timeinfo) {
		this.timeinfo = timeinfo;
	}


	public double getSalary() {
		return salary;
	}


	public void setSalary(double salary) {
		this.salary = salary;
	}


	public Date getD() {
		return d;
	}


	public void setD(Date d) {
		this.d = d;
	}


	public int getPincode() {
		return pincode;
	}


	public void setPincode(int pincode) {
		this.pincode = pincode;
	}


	public Schedule(int cid, int pincode, String cname, String cdoamin,
			String street, String area, String city, String state,
			String cdesc, String email, String job, String venue,
			String timeinfo, double salary, Date d) {
		super();
		this.cid = cid;
		this.pincode = pincode;
		this.cname = cname;
		this.cdoamin = cdoamin;
		this.street = street;
		this.area = area;
		this.city = city;
		this.state = state;
		this.cdesc = cdesc;
		this.email = email;
		this.job = job;
		this.venue = venue;
		this.timeinfo = timeinfo;
		this.salary = salary;
		this.d = d;
	}


	
	
	
	

}
