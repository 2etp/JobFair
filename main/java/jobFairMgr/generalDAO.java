package jobFairMgr;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class generalDAO {
	private DBConnectionMgr pool;
	
	// 사용자마다 현재 프로젝트의 경로가 다르기 때문에 그걸 미리 구해놓고 파일 업로드 경로를 상대적으로 바꿔준다
//	private static String path = (System.getProperty("user.dir")).replace("\\", "/");
//	private static final String SAVEFOLDER = path + "/Project1/FirstProject/src/main/webapp/uploadFiles/";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 10*1024*1024;
	
	public generalDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 

	// 기업측 회원가입
	public boolean insertGeneral(generalVO vo) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into ";
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		
		return flag;
	}
	
	// 채용공고 리스트(로고, 기업명, 근무지역, 직무, 지원기간)
	public List<OpeningListVO> getOpeningList(int startRow, int pageSize) {
		List<OpeningListVO> list = new ArrayList<OpeningListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task from generals As g join jobopening as j on g.comNum = j.comNum order by employNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow - 1);
			pstmt.setInt(2, pageSize);
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
			pool.freeConnection(con, pstmt);
		}
		return list;
	}
	
	// 채용공고에 등록된 글이 총 몇개인지 반환
	public int getOpeningCount() {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task from generals As g join jobopening as j on g.comNum = j.comNum order by employNum desc";
			pstmt = con.prepareStatement(sql);
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
	
	
	
	// 채용공고 등록
	
	
	
	// 등록된 채용공고의 상세정보가 담긴 VO반환
	public jobOpeningVO getOpening() {
		jobOpeningVO vo = new jobOpeningVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from jobopening";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setEmployNum(rs.getInt("employNum"));
				vo.setComNum(rs.getInt("comNum"));
				vo.setTitle(rs.getString("title"));
				vo.setPosition(rs.getString("position"));
				vo.setPeople(rs.getInt("people"));
				vo.setTask(rs.getString("task"));
				vo.setWorkArea(rs.getString("workArea"));
				vo.setEducation(rs.getString("career"));
				vo.setEmployType(rs.getString("employType"));
				vo.setWorkType(rs.getString("workType"));
				vo.setPay(rs.getString("pay"));
				vo.setInsurance(rs.getString("insurance"));
				vo.setOfficeHours(rs.getString("officeHours"));
				vo.setEtc(rs.getString("etc"));
				vo.setMajor(rs.getString("major"));
				vo.setCertificate(rs.getString("certificate"));
				vo.setComputerLevel(rs.getString("computerLevel"));
				vo.setFacilities(rs.getString("facilities"));
				vo.setWelfare(rs.getString("welfare"));
				vo.setPreferred(rs.getString("preferred"));
				vo.setOpeningDate(rs.getString("openingDate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return vo;
	}
	
	
	
}
