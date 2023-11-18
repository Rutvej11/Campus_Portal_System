package Company;

public class StudentList 
{

	long prnno;
	String fname,mname,lname,rname,rstatus,finalresult,icode;
	
	
	public StudentList(long prnno, String fname, String mname, String lname, String rname, String rstatus, String finalresult,
			String icode) {
		super();
		this.prnno = prnno;
		this.fname = fname;
		this.mname = mname;
		this.lname = lname;
		this.rname = rname;
		this.rstatus = rstatus;
		this.finalresult = finalresult;
		this.icode = icode;
	}


	public long getPrnno() {
		return prnno;
	}


	public void setPrnno(long prnno) {
		this.prnno = prnno;
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

	public String getRname() {
		return rname;
	}


	public void setRname(String rname) {
		this.rname = rname;
	}


	public String getRstatus() {
		return rstatus;
	}


	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}


	public String getFinalresult() {
		return finalresult;
	}


	public void setFinalresult(String finalresult) {
		this.finalresult = finalresult;
	}


	public String getIcode() {
		return icode;
	}


	public void setIcode(String icode) {
		this.icode = icode;
	}


	public StudentList() {
		// TODO Auto-generated constructor stub
	}

	public static void main(String[] args){

	}


}
