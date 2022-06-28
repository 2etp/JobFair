package jobFairMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;




public class DisabilityDAO {
	private DBConnectionMgr pool;
	
	// 사용자마다 현재 프로젝트의 경로가 다르기 때문에 그걸 미리 구해놓고 파일 업로드 경로를 상대적으로 바꿔준다
//	private static String path = (System.getProperty("user.dir")).replace("\\", "/");
//	private static final String SAVEFOLDER = path + "/Project1/FirstProject/src/main/webapp/uploadFiles/";
//	private static final String ENCTYPE = "UTF-8";
//	private static int MAXSIZE = 10*1024*1024;
	
	public DisabilityDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 로그인
	// 이름과 휴대폰번호를 입력받음
	public int login(String name, String phoneNum) {
		Connection con = null;				
		PreparedStatement pstmt = null;		
		String sql = null;
		ResultSet rs = null;
		
		// 1 : 아이디가 존재하지 않음
		// 2 : 비밀번호가 일치하지 않음
		// 3 : 로그인 성공
		int flag = 0;
		try {
			con = pool.getConnection();
			// 입력받은 이름이 데이터베이스에 존재하는지 확인
			sql = "select name, phoneNum from users where name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			// id가 없으니 1을 반환
			if(!rs.next()) {
				flag = 1;
				return flag;
			}
			// sql문을 돌려 나온 비밀번호가 입력받은 비밀번호와 일치하는지 확인
			// 일치하지 않으면 2를 반환
			else if(!(rs.getString("phoneNum").equals(phoneNum))) {
				flag = 2;
				return flag;
			} else {
				flag = 3;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	// 유저정보 출력
	
	// 관심기업 리스트 출력
	public List<OpeningListVO> getPickedList(int userNum, int startRow, int pageSize) {
		List<OpeningListVO> list = new ArrayList<OpeningListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task  from generals As g  join jobopening as j on g.comNum = j.comNum join intercom as i on i.employNum = j.employNum where i.userNum = ? order by employNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				OpeningListVO vo = new OpeningListVO();
				vo.setLogoName(rs.getString("logoName"));
				vo.setLogoSize(rs.getInt("logoSize"));
				vo.setComNum(rs.getInt("comNum"));
				vo.setComName(rs.getString("comName"));
				vo.setEmployNum(rs.getInt("employNum"));
				vo.setOpeningDate(rs.getString("openingDate"));
				vo.setWorkArea(rs.getString("workArea"));
				vo.setTask(rs.getString("task"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	
	// 관심공고에 등록된 글이 총 몇개인지 반환
	public int getPickedCount(int userNum) {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName from generals As g  join jobopening as j on g.comNum = j.comNum join intercom as i on i.employNum = j.employNum where i.userNum = ? order by employNum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return cnt;
	}
	
	// 지원한 기업 리스트 출력
	public List<ApplyListVO> getApplyList(int userNum, int startRow, int pageSize) {
		List<ApplyListVO> list = new ArrayList<ApplyListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.task, j.openingDate, a.progress, r.resumeNum from generals As g join jobopening As j on g.comNum = j.comNum join applycom As a on a.employNum = j.employNum join resume As r on r.resumeNum = a.resumeNum where a.userNum = ? order by employNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			pstmt.setInt(2, startRow - 1);
			pstmt.setInt(3, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ApplyListVO vo = new ApplyListVO();
				vo.setLogoName(rs.getString("logoName"));
				vo.setLogoSize(rs.getInt("logoSize"));
				vo.setComNum(rs.getInt("comNum"));
				vo.setComName(rs.getString("comName"));
				vo.setEmployNum(rs.getInt("employNum"));
				vo.setTask(rs.getString("task"));
				vo.setOpeningDate(rs.getString("openingDate"));
				vo.setProgress(rs.getString("progress"));
				vo.setResumeNum(rs.getInt("resumeNum"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	// 지원한 채용공고가 총 몇개인지
	public int getApplyCount(int userNum) {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName from generals As g join jobopening As j on g.comNum = j.comNum join applycom As a on a.employNum = j.employNum join resume As r on r.resumeNum = a.resumeNum where a.userNum = ? order by j.employNum desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return cnt;
	}
	
	
	
}
