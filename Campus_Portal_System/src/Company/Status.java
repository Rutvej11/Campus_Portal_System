package Company;

public class Status
{

	long prn;
	@Override
	public String toString() {
		return "Status [prn=" + prn + ", roundname=" + roundname
				+ ", roundstatus=" + roundstatus + ", fresult=" + fresult + "]";
	}

	public long getPrn() {
		return prn;
	}

	public void setPrn(long prn) {
		this.prn = prn;
	}

	public String getRoundname() {
		return roundname;
	}

	public void setRoundname(String roundname) {
		this.roundname = roundname;
	}

	public String getRoundstatus() {
		return roundstatus;
	}

	public void setRoundstatus(String roundstatus) {
		this.roundstatus = roundstatus;
	}

	public String getFresult() {
		return fresult;
	}

	public void setFresult(String fresult) {
		this.fresult = fresult;
	}

	public Status(long prn, String roundname, String roundstatus, String fresult) {
		super();
		this.prn = prn;
		this.roundname = roundname;
		this.roundstatus = roundstatus;
		this.fresult = fresult;
	}

	String roundname,roundstatus,fresult;
	
	public Status() {
		// TODO Auto-generated constructor stub
	}

}
