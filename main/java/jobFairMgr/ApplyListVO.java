package jobFairMgr;

// 지원현황 리스트
public class ApplyListVO {
	private String logoName;
	private int logoSize;
	private int comNum;
	private String comName;
	private int employNum;
	private String openingDate;
	private String task;
	private String progress;
	private int resumeNum;
	
	public int getResumeNum() {
		return resumeNum;
	}
	public void setResumeNum(int resumeNum) {
		this.resumeNum = resumeNum;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
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
	public int getEmployNum() {
		return employNum;
	}
	public void setEmployNum(int employNum) {
		this.employNum = employNum;
	}
	public String getOpeningDate() {
		return openingDate;
	}
	public void setOpeningDate(String openingDate) {
		this.openingDate = openingDate;
	}
	public String getTask() {
		return task;
	}
	public void setTask(String task) {
		this.task = task;
	}
}
