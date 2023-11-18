package Student;

public class Graduation
{
	Double prn;
	String qualification,uname,iname,degree,stream;
	int duration,s1,s2,s3,s4,s5,s6,s7,s8,total,obtmarks,admissionyr,passingyr;
	float per;

	public Graduation() {
		// TODO Auto-generated constructor stub
	}

	public Graduation(Double prn, String qualification, String uname,
			String iname, String degree, String stream, int duration, int s1,
			int s2, int s3, int s4, int s5, int s6, int s7, int s8, int total,
			int obtmarks, int admissionyr, int passingyr, float per) {
		super();
		this.prn = prn;
		this.qualification = qualification;
		this.uname = uname;
		this.iname = iname;
		this.degree = degree;
		this.stream = stream;
		this.duration = duration;
		this.s1 = s1;
		this.s2 = s2;
		this.s3 = s3;
		this.s4 = s4;
		this.s5 = s5;
		this.s6 = s6;
		this.s7 = s7;
		this.s8 = s8;
		this.total = total;
		this.obtmarks = obtmarks;
		this.admissionyr = admissionyr;
		this.passingyr = passingyr;
		this.per = per;
	}

	public Double getPrn() {
		return prn;
	}

	public void setPrn(Double prn) {
		this.prn = prn;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getIname() {
		return iname;
	}

	public void setIname(String iname) {
		this.iname = iname;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getStream() {
		return stream;
	}

	public void setStream(String stream) {
		this.stream = stream;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public int getS1() {
		return s1;
	}

	public void setS1(int s1) {
		this.s1 = s1;
	}

	public int getS2() {
		return s2;
	}

	public void setS2(int s2) {
		this.s2 = s2;
	}

	public int getS3() {
		return s3;
	}

	public void setS3(int s3) {
		this.s3 = s3;
	}

	public int getS4() {
		return s4;
	}

	public void setS4(int s4) {
		this.s4 = s4;
	}

	public int getS5() {
		return s5;
	}

	public void setS5(int s5) {
		this.s5 = s5;
	}

	public int getS6() {
		return s6;
	}

	public void setS6(int s6) {
		this.s6 = s6;
	}

	public int getS7() {
		return s7;
	}

	public void setS7(int s7) {
		this.s7 = s7;
	}

	public int getS8() {
		return s8;
	}

	public void setS8(int s8) {
		this.s8 = s8;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getObtmarks() {
		return obtmarks;
	}

	public void setObtmarks(int obtmarks) {
		this.obtmarks = obtmarks;
	}

	public int getAdmissionyr() {
		return admissionyr;
	}

	public void setAdmissionyr(int admissionyr) {
		this.admissionyr = admissionyr;
	}

	public int getPassingyr() {
		return passingyr;
	}

	public void setPassingyr(int passingyr) {
		this.passingyr = passingyr;
	}

	public float getPer() {
		return per;
	}

	public void setPer(float per) {
		this.per = per;
	}

	@Override
	public String toString() {
		return "Graduation [prn=" + prn + ", qualification=" + qualification
				+ ", uname=" + uname + ", iname=" + iname + ", degree="
				+ degree + ", stream=" + stream + ", duration=" + duration
				+ ", s1=" + s1 + ", s2=" + s2 + ", s3=" + s3 + ", s4=" + s4
				+ ", s5=" + s5 + ", s6=" + s6 + ", s7=" + s7 + ", s8=" + s8
				+ ", total=" + total + ", obtmarks=" + obtmarks
				+ ", admissionyr=" + admissionyr + ", passingyr=" + passingyr
				+ ", per=" + per + "]";
	}
	
	
	

}
