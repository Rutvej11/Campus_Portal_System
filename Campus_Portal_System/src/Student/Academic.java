package Student;

public class Academic
{
	String qualification,specialization,board,institute;
	int obt_marks,total_marks,passing_yr;
	double per;

	public Academic()
	{
		// TODO Auto-generated constructor stub
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialization() {
		return specialization;
	}

	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public int getObt_marks() {
		return obt_marks;
	}

	public void setObt_marks(int obt_marks) {
		this.obt_marks = obt_marks;
	}

	public int getTotal_marks() {
		return total_marks;
	}

	public void setTotal_marks(int total_marks) {
		this.total_marks = total_marks;
	}

	public int getPassing_yr() {
		return passing_yr;
	}

	public void setPassing_yr(int passing_yr) {
		this.passing_yr = passing_yr;
	}

	public double getPer() {
		return per;
	}

	public void setPer(double per) {
		this.per = per;
	}

	public Academic(String qualification, String specialization, String board,
			String institute, int obt_marks, int total_marks, int passing_yr,
			double per) {
		super();
		this.qualification = qualification;
		this.specialization = specialization;
		this.board = board;
		this.institute = institute;
		this.obt_marks = obt_marks;
		this.total_marks = total_marks;
		this.passing_yr = passing_yr;
		this.per = per;
	}

	@Override
	public String toString() {
		return "Academic [qualification=" + qualification + ", specialization="
				+ specialization + ", board=" + board + ", institute="
				+ institute + ", obt_marks=" + obt_marks + ", total_marks="
				+ total_marks + ", passing_yr=" + passing_yr + ", per=" + per
				+ "]";
	}
	
	

}
