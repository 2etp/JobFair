package jobFairMgr;

// 채용공고 VO
public class jobOpeningVO {
	private int employNum;			// 채용공고 고유번호
	private int comNum;			// 기업 고유번호 -> 나중에 외래키로 쓰여질 예정
	private String title;			// 채용공고 이름
	private String position;		// 모집 직종
	private int people;				// 모집 인원
	private String task;			// 직무 내용
	private String workArea;		// 근무 지역
	private String education;		// 학력
	private String career;			// 경력
	private String employType;		// 고용형태
	private String workType;		// 근무형태
	private String pay;				// 급여조건
	private String insurance;		// 사회보험
	private String officeHours;		// 근무시간
	private String etc;				// 기타
	private String major;			// 전공
	private String certificate;		// 자격증
	private String computerLevel;	// 컴퓨터활용
	private String facilities;		// 편의시설
	private String welfare;			// 복리후생
	private String preferred;		// 우대사항
	private String openingDate;		// 채용공고 기간
	private String overtime;		// 잔업
	private String bonus;			// 상여금
	private String severancePay;	// 퇴직금
	
	
	public String getOvertime() {
		return overtime;
	}
	public void setOvertime(String overtime) {
		this.overtime = overtime;
	}
	public String getBonus() {
		return bonus;
	}
	public void setBonus(String bonus) {
		this.bonus = bonus;
	}
	public String getSeverancePay() {
		return severancePay;
	}
	public void setSeverancePay(String severancePay) {
		this.severancePay = severancePay;
	}
	public int getEmployNum() {
		return employNum;
	}
	public void setEmployNum(int employNum) {
		this.employNum = employNum;
	}
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
	public String getWorkArea() {
		return workArea;
	}
	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getEmployType() {
		return employType;
	}
	public void setEmployType(String employType) {
		this.employType = employType;
	}
	public String getWorkType() {
		return workType;
	}
	public void setWorkType(String workType) {
		this.workType = workType;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getOfficeHours() {
		return officeHours;
	}
	public void setOfficeHours(String officeHours) {
		this.officeHours = officeHours;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getCertificate() {
		return certificate;
	}
	public void setCertificate(String certificate) {
		this.certificate = certificate;
	}
	public String getComputerLevel() {
		return computerLevel;
	}
	public void setComputerLevel(String computerLevel) {
		this.computerLevel = computerLevel;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public String getPreferred() {
		return preferred;
	}
	public void setPreferred(String preferred) {
		this.preferred = preferred;
	}
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}
}
