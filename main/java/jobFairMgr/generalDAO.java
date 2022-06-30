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
	private static String path = (System.getProperty("user.dir")).replace("\\", "/");
	private static final String SAVEFOLDER = path + "/JobFair/JobFair/src/main/webapp/image/";
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
	public boolean insertGeneral(HttpServletRequest request, HttpServletResponse response) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String fileName = null;
		
		try {
			con = pool.getConnection();
			File file = new File(SAVEFOLDER);
			if(!file.exists()) file.mkdirs();
			
			multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("filename") != null) {
				fileName = multi.getFilesystemName("filename");
				fileSize = (int)multi.getFile("filename").length();
			}
			
			sql = "insert into generals(comName, comAddress, ceoName, comUrl, comTel, sectors, businessInfo, comSize, logoName, logoSize, userType) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, biz)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("companyName"));
			pstmt.setString(2, multi.getParameter("address"));
			pstmt.setString(3, multi.getParameter("ceoName"));
			pstmt.setString(4, multi.getParameter("homepage"));
			pstmt.setString(5, multi.getParameter("mobile"));
			pstmt.setString(6, multi.getParameter("sectors"));
			pstmt.setString(7, multi.getParameter("businessInfo"));
			pstmt.setString(8, multi.getParameter("comSize"));
			pstmt.setString(9, fileName);
			pstmt.setInt(10, fileSize);
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
	
	// 기업측 로그인
	
	
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
			pool.freeConnection(con, pstmt, rs);
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
	
	
	// 기업정보 반환
	public generalVO getGeneral(int comNum) {
		generalVO vo = new generalVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from general where comNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, comNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setComNum(rs.getInt("comNum"));
				vo.setComName(rs.getString("comName"));
				vo.setCeoName(rs.getString("ceoName"));
				vo.setFoundedDate(rs.getString("foundedDate"));
				vo.setComAddress(rs.getString("comAddress"));
				vo.setComUrl(rs.getString("comUrl"));
				vo.setComTel(rs.getString("comTel"));
				vo.setSectors(rs.getString("sectors"));
				vo.setBusinessInfo(rs.getString("businessInfo"));
				vo.setComSize(rs.getString("comSize"));
				vo.setLogoName(rs.getString("logoName"));
				vo.setLogoSize(rs.getInt("logoSize"));
				vo.setUserType(rs.getString("userType"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	
	// 등록된 채용공고의 상세정보가 담긴 VO반환
	public jobOpeningVO getOpening(int employNum) {
		jobOpeningVO vo = new jobOpeningVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from jobopening where employNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, employNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setEmployNum(rs.getInt("employNum"));
				vo.setComNum(rs.getInt("comNum"));
				vo.setTitle(rs.getString("title"));
				vo.setPosition(rs.getString("position"));
				vo.setPeople(rs.getInt("people"));
				vo.setTask(rs.getString("task"));
				vo.setWorkArea(rs.getString("workArea"));
				vo.setEducation(rs.getString("education"));
				vo.setCareer(rs.getString("career"));
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
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	// 기업명으로 채용공고 검색
	public List<OpeningListVO> getSearchName(String comName, int startRow, int pageSize) {
		List<OpeningListVO> list = new ArrayList<OpeningListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task from generals As g join jobopening as j on g.comNum = j.comNum and comName like ? order by employNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + comName + "%");
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
	
	// 기업명으로 검색했을 때 결과물이 총 몇개인지 반환 
	public int getSearchNameCount(String comName) {
		int cnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task from generals As g join jobopening as j on g.comNum = j.comNum and comName like ? order by j.employNum";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + comName + "%");
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
	
	
	// 다중조건으로 채용공고 검색(근무지역, 근무형태, 우대사항)
	public List<OpeningListVO> getSearchOther(String sectors, String workArea, String workType, int startRow, int pageSize) {
		List<OpeningListVO> list = new ArrayList<OpeningListVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		// sql 문의 ?의 위치를 저장
		int cnt = 1;
		
		try {
			con = pool.getConnection();
			// sql문 기본 세팅
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task from generals As g join jobopening as j on g.comNum = j.comNum ";
			// 어느 조건을 넣어서 검색했는가에 따라 sql문 추가
			if(!sectors.equals("")) sql += "and sectors like ? ";
			if(!workArea.equals("")) sql += "and workArea like ? ";
			if(!workType.equals("")) sql += "and workType like ? ";
			// sql문 마무리
			sql += "order by employNum desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			
			// sql문을 얼마나 추가했는지에 따라 알맞게 채워주고 ?의 위치값을 1증가시킨다
			if(!sectors.equals("")) {
				pstmt.setString(cnt, "%" + sectors + "%");
				cnt++;
			}
			if(!workArea.equals("")) {
				pstmt.setString(cnt, "%" + workArea + "%");
				cnt++;
			}
			if(!workType.equals("")) {
				pstmt.setString(cnt, "%" + workType + "%");
				cnt++;
			}
			
			pstmt.setInt(cnt, startRow - 1);
			cnt++;
			pstmt.setInt(cnt, pageSize);
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
	
	// 기업명으로 검색했을 때 결과물이 총 몇개인지 반환 
	public int getSearchOtherCount(String sectors, String workArea, String workType) {
		int cnt = 1;
		int rsCnt = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select g.logoName, g.logoSize, g.comNum, g.comName, j.employNum, j.openingDate, j.workArea, j.task from generals As g join jobopening as j on g.comNum = j.comNum ";
			// 어느 조건을 넣어서 검색했는가에 따라 sql문 추가
			if(!sectors.equals("")) sql += "and sectors like ? ";
			if(!workArea.equals("")) sql += "and workArea like ? ";
			if(!workType.equals("")) sql += "and workType like ? ";
			sql += "order by j.employNum";
			pstmt = con.prepareStatement(sql);
			// sql문을 얼마나 추가했는지에 따라 알맞게 채워주고 ?의 위치값을 1증가시킨다
			if(!sectors.equals("")) {
				pstmt.setString(cnt, "%" + sectors + "%");
				cnt++;
			}
			if(!workArea.equals("")) {
				pstmt.setString(cnt, "%" + workArea + "%");
				cnt++;
			}
			if(!workType.equals("")) {
				pstmt.setString(cnt, "%" + workType + "%");
				cnt++;
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rsCnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return rsCnt;
	}
}
