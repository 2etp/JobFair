package jobFairMgr;

// 지원상황
public class ApplyVO {
	private int seq;			// 고유번호
	private int userNum;		// 유저 고유번호
	private int employNum;		// 채용공고 고유번호
	private int resumeNum;		// 이력서 고유번호
	private String progress;	// 진행현황(서류심사, 1차 면접 합격...)
	private String regiDate;	// 지원한 날짜
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public int getEmployNum() {
		return employNum;
	}
	public void setEmployNum(int employNum) {
		this.employNum = employNum;
	}
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
	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
}
