package jobFairMgr;

// 기업 회원가입 VO
public class generalVO {
	private int comNum;				// 기업 고유번호
	private String comName;			// 기업명
	private String ceoName;			// 대표자
	private String comAddress;		// 기업 주소
	private String comUrl;			// 기업 홈페이지
	private String comTel;			// 연락처
	private String sectors;			// 업종
	private String businessInfo;	// 사업내용
	private String comSize;			// 기업 규모
	private String logoName;		// 기업로고 이미지 이름
	private int logoSize;			// 이미지 크기
	private String userType;		// 개인인지 기업인지
	
	
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getComNum() {
		return comNum;
	}
	public void setComNum(int comNum) {
		this.comNum = comNum;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getCeoName() {
		return ceoName;
	}
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getComUrl() {
		return comUrl;
	}
	public void setComUrl(String comUrl) {
		this.comUrl = comUrl;
	}
	public String getComTel() {
		return comTel;
	}
	public void setComTel(String comTel) {
		this.comTel = comTel;
	}
	public String getSectors() {
		return sectors;
	}
	public void setSectors(String sectors) {
		this.sectors = sectors;
	}
	public String getBusinessInfo() {
		return businessInfo;
	}
	public void setBusinessInfo(String businessInfo) {
		this.businessInfo = businessInfo;
	}
	public String getComSize() {
		return comSize;
	}
	public void setComSize(String comSize) {
		this.comSize = comSize;
	}
	public String getLogoName() {
		return logoName;
	}
	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}
	public int getLogoSize() {
		return logoSize;
	}
	public void setLogoSize(int logoSize) {
		this.logoSize = logoSize;
	}

}
