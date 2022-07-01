package jobFairMgr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class DisabilityDAO {
	private DBConnectionMgr pool;
	
    // 사용자마다 현재 프로젝트의 경로가 다르기 때문에 그걸 미리 구해놓고 파일 업로드 경로를 상대적으로 바꿔준다	
	private static String path = (System.getProperty("user.dir")).replace("\\", "/");
	private static final String SAVEFOLDER = path + "/JobFair/JobFair/src/main/webapp/image/";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 10*1024*1024;
	
	public DisabilityDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    // 회원가입
	public boolean insertUser(HttpServletRequest request) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		MultipartRequest multi = null;
		String sql = null;
		String sex = null;
		try {
			con = pool.getConnection();
			multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			if(multi.getParameter("suffixNum").charAt(0) == '1' ||
					multi.getParameter("suffixNum").charAt(0) == '3') {
				sex = "남";
			} else {
				sex = "여";
			}
			
			
			sql = "insert into users(name, prefixNum, suffixNum, livingArea, phoneNum, disType, disLevel, userType, sex)values(?, ?, ?, ?, ?, ?, ?, 'dis', ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("name"));
			pstmt.setString(2, multi.getParameter("prefixNum"));
			pstmt.setString(3, multi.getParameter("suffixNum"));
			pstmt.setString(4, multi.getParameter("livingArea"));
			pstmt.setString(5, multi.getParameter("mobile"));
			pstmt.setString(6, multi.getParameter("type"));
			pstmt.setString(7, multi.getParameter("grade"));
			pstmt.setString(8, sex);
			
            // executeUpdate 의 반환값은 insert,update,delete인 경우, 관련된 레코드의 수를 반환
            // create, drop, alter인 경우에는 0을 반환
            // 회원가입에는 1명의 정보를 저장하기 때문에 성공적으로 가입이 되었다면 1을 반환할 것이다.
			if (pstmt.executeUpdate() == 1) {
				flag = true;				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
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
    // 매개변수로 받은 name의 모든 정보를 반환(VO)
	public DisabilityVO getUser(String name) {
		DisabilityVO vo = new DisabilityVO();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from users where name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setUserNum(rs.getInt("userNum"));
				vo.setName(rs.getString("name"));
				vo.setPrefixNum(rs.getString("prefixNum"));
				vo.setSuffixNum(rs.getString("suffixNum"));
				vo.setLivingArea(rs.getString("livingArea"));
				vo.setPhoneNum(rs.getString("phoneNum"));
				vo.setDisType(rs.getString("disType"));
				vo.setDisLevel(rs.getString("disLevel"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
    // 관심공고 등록
    // 보고있던 채용공고 번호와 로그인된 계정의 고유번호를 집어넣음
    public boolean addInterCom(int employNum, int userNum) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        try {
            con = pool.getConnection();
            sql ="insert into intercom (userNum, employNum) values(?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, userNum);
            pstmt.setInt(2, employNum);
            if (pstmt.executeUpdate() == 1) {
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            pool.freeConnection(con, pstmt);
        }
        return flag;
    }
	
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
			sql = "select g.logoName from generals As g  join jobopening as j on g.comNum = j.comNum join intercom as i on i.employNum = j.employNum where i.userNum = ? order by j.employNum desc";
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
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.task, j.openingDate, a.progress, r.resumeNum from generals As g join jobopening As j on g.comNum = j.comNum join applycom As a on a.employNum = j.employNum join resume As r on r.resumeNum = a.resumeNum where a.userNum = ? order by j.employNum desc limit ?, ?";
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
