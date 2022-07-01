package jobFairMgr;

public class DisabilityVO {
	private int userNum;			// 유저 고유번호
	private String name;			// 이름
	private String prefixNum;		// 주민 앞자리
	private String suffixNum;		// 주민 뒷자리
	private String livingArea;		// 거주지역
	private String phoneNum;		// 휴대폰 번호
	private String disType;			// 장애타입
	private String disLevel;		// 장애등급
	private String userType;		// 개인인지 기업인지
	private String sex;				// 성별
	
	
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrefixNum() {
		return prefixNum;
	}
	public void setPrefixNum(String prefixNum) {
		this.prefixNum = prefixNum;
	}
	public String getSuffixNum() {
		return suffixNum;
	}
	public void setSuffixNum(String suffixNum) {
		this.suffixNum = suffixNum;
	}
	public String getLivingArea() {
		return livingArea;
	}
	public void setLivingArea(String livingArea) {
		this.livingArea = livingArea;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getDisType() {
		return disType;
	}
	public void setDisType(String disType) {
		this.disType = disType;
	}
	public String getDisLevel() {
		return disLevel;
	}
	public void setDisLevel(String disLevel) {
		this.disLevel = disLevel;
	}
	
}
