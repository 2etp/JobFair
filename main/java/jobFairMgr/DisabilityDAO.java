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
	
	// �궗�슜�옄留덈떎 �쁽�옱 �봽濡쒖젥�듃�쓽 寃쎈줈媛� �떎瑜닿린 �븣臾몄뿉 洹멸구 誘몃━ 援ы빐�넃怨� �뙆�씪 �뾽濡쒕뱶 寃쎈줈瑜� �긽���쟻�쑝濡� 諛붽퓭以��떎
	private static String path = (System.getProperty("user.dir")).replace("\\", "/");
	private static final String SAVEFOLDER = path + "/Jobfair/Jobfair/src/main/webapp/image/";
	private static final String ENCTYPE = "UTF-8";
	private static int MAXSIZE = 10*1024*1024;
	
	public DisabilityDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// �쉶�썝媛��엯
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
			
			// executeUpdate �쓽 諛섑솚媛믪� insert,update,delete�씤 寃쎌슦, 愿��젴�맂 �젅肄붾뱶�쓽 �닔瑜� 諛섑솚
			// create, drop, alter�씤 寃쎌슦�뿉�뒗 0�쓣 諛섑솚
			// �쉶�썝媛��엯�뿉�뒗 1紐낆쓽 �젙蹂대�� ���옣�븯湲� �븣臾몄뿉 �꽦怨듭쟻�쑝濡� 媛��엯�씠 �릺�뿀�떎硫� 1�쓣 諛섑솚�븷 寃껋씠�떎.
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
	
	
	
	// 濡쒓렇�씤
	// �씠由꾧낵 �쑕���룿踰덊샇瑜� �엯�젰諛쏆쓬
	public int login(String name, String phoneNum) {
		Connection con = null;				
		PreparedStatement pstmt = null;		
		String sql = null;
		ResultSet rs = null;
		
		// 1 : �븘�씠�뵒媛� 議댁옱�븯吏� �븡�쓬
		// 2 : 鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�쓬
		// 3 : 濡쒓렇�씤 �꽦怨�
		int flag = 0;
		try {
			con = pool.getConnection();
			// �엯�젰諛쏆� �씠由꾩씠 �뜲�씠�꽣踰좎씠�뒪�뿉 議댁옱�븯�뒗吏� �솗�씤
			sql = "select name, phoneNum from users where name = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			// id媛� �뾾�쑝�땲 1�쓣 諛섑솚
			if(!rs.next()) {
				flag = 1;
				return flag;
			}
			// sql臾몄쓣 �룎�젮 �굹�삩 鍮꾨�踰덊샇媛� �엯�젰諛쏆� 鍮꾨�踰덊샇�� �씪移섑븯�뒗吏� �솗�씤
			// �씪移섑븯吏� �븡�쑝硫� 2瑜� 諛섑솚
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
	
	// �쑀���젙蹂� 異쒕젰
	// 留ㅺ컻蹂��닔濡� 諛쏆� name�쓽 紐⑤뱺 �젙蹂대�� 諛섑솚(VO)
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
	
	// 愿��떖湲곗뾽 由ъ뒪�듃 異쒕젰
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
	
	
	// 愿��떖怨듦퀬�뿉 �벑濡앸맂 湲��씠 珥� 紐뉕컻�씤吏� 諛섑솚
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
	
	// 吏��썝�븳 湲곗뾽 由ъ뒪�듃 異쒕젰
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
	
	// 吏��썝�븳 梨꾩슜怨듦퀬媛� 珥� 紐뉕컻�씤吏�
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
