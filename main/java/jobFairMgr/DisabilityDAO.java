package jobFairMgr;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class DisabilityDAO {
	private DBConnectionMgr pool;
	
    // 사용자마다 현재 프로젝트의 경로가 다르기 때문에 그걸 미리 구해놓고 파일 업로드 경로를 상대적으로 바꿔준다	
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
				vo.setSex(rs.getString("sex"));
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
    
    // 관심공고 삭제
    public boolean deleteInterCom(int employNum, int userNum) {
        boolean flag = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        try {
            con = pool.getConnection();
            sql ="delete from intercom where employNum = ? and userNum = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, employNum);
            pstmt.setInt(2, userNum);
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
    
    // 관심공고 여부 확인
    // 로그인된 user의 고유번호와 보고있는 채용공고의 번호를 넣어서 관심공고에 등록됐는지 여부 확인
    // 존재하면 true, 없으면 false
    public boolean isExistInter(int employNum, int userNum) {
    	boolean flag = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        ResultSet rs = null;
        try {
        	con = pool.getConnection();
        	sql = "select employNum from intercom where userNum = ?";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setInt(1, userNum);
        	rs = pstmt.executeQuery();
        	while(rs.next()) {
        		if(rs.getInt("employNum") == employNum) {
        			flag = true;
        			break;
        		}
        	}
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
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
	
//	// request에 들어간 데이터를 배열로 반환
//	private List<String> dataIntoArr(HttpServletRequest request) throws IOException {
//		List<String> list = new ArrayList<String>();
//		MultipartRequest multi = null;
//		multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
//		
//		Enumeration params = request.getParameterNames();
//		while(params.hasMoreElements()) {
//		  String name = (String) params.nextElement();
//		  list.add(request.getParameter(name)); 
//		}
//		
//		return list;
//	}
	
	// 이력서 저장
	public boolean insertResume(HttpServletRequest request) {
		boolean flag = false;
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String fileName = null;
		// sql 문에 몇 개의 ?를 넣을 것인가 -> not null 컬럼이 5개 있기때문에 디폴트는 5
		int questmark = 5;
		
		try {
//			con = pool.getConnection();
//			// request를 넘겨주어 dataIntoArr 메소드 안에서 멀티파트를 만들고 그 안에 들어있는 파라미터를 ArrayList로 묶어 반환 
//			List<String> dataList = dataIntoArr(request);
//			
//			File file = new File(SAVEFOLDER);
//			if(!file.exists()) file.mkdirs();
//			
//			multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
//			if(multi.getFilesystemName("filename") != null) {
//				fileName = multi.getFilesystemName("filename");
//				fileSize = (int)multi.getFile("filename").length();
//			}
			
//			Enumeration params = request.getParameterNames();
//			while(params.hasMoreElements()) {
//			  String name = (String) params.nextElement();
//			  System.out.println(name + " : " + request.getParameter(name)); 
//			}
			
			// multi에 들어있는 파라미터 요소들을 배열로 저장해서 index를 활용해 반복문을 돌린다?
			// pstmt.setString에서 배열 넘버와 index + 1번 자리에 배열의 값
			//if(arr[index] != null) {
			//}
			// pstmt.setString(index + 1, arr[index])
			
			
			// sql 기본세팅
//			sql = "insert into resume (userNum, militaryService, assistive, schoolName, education";
//			// 이력서의 각 input필드의 값이 null인지 확인하고 null이 아닐시 sql문에 추가 후 ?개수를 1씩 증가
//			if(multi.getParameter("assistiveDevice") != null) {
//				sql += ", assistiveDevice";
//				questmark++;
//			}
//			if(multi.getParameter("major") != null) {
//				sql += ", major";
//				questmark++;
//			}
//			if(multi.getParameter("institutionName1") != null) {
//				sql += ", institutionName1";
//				questmark++;
//			}
//			if(multi.getParameter("institutionName2") != null) {
//				sql += ", institutionName2";
//				questmark++;
//			}
//			if(multi.getParameter("institutionName3") != null) {
//				sql += ", institutionName3";
//				questmark++;
//			}
//			if(multi.getParameter("period1") != null) {
//				sql += ", period1";
//				questmark++;
//			}
//			if(multi.getParameter("period2") != null) {
//				sql += ", period2";
//				questmark++;
//			}
//			if(multi.getParameter("period3") != null) {
//				sql += ", period3";
//				questmark++;
//			}
//			if(multi.getParameter("content1") != null) {
//				sql += ", content1";
//				questmark++;
//			}
//			if(multi.getParameter("content2") != null) {
//				sql += ", content2";
//				questmark++;
//			}
//			if(multi.getParameter("content3") != null) {
//				sql += ", content3";
//				questmark++;
//			}
//			if(multi.getParameter("note1") != null) {
//				sql += ", note1";
//				questmark++;
//			}
//			if(multi.getParameter("note2") != null) {
//				sql += ", note2";
//				questmark++;
//			}
//			if(multi.getParameter("note3") != null) {
//				sql += ", note3";
//				questmark++;
//			}
//			if(multi.getParameter("certificate1") != null) {
//				sql += ", certificate1";
//				questmark++;
//			}
//			if(multi.getParameter("certificate2") != null) {
//				sql += ", certificate2";
//				questmark++;
//			}
//			if(multi.getParameter("certificate3") != null) {
//				sql += ", certificate3";
//				questmark++;
//			}
//			if(multi.getParameter("certificateNum1") != null) {
//				sql += ", certificateNum1";
//				questmark++;
//			}
//			if(multi.getParameter("certificateNum2") != null) {
//				sql += ", certificateNum2";
//				questmark++;
//			}
//			if(multi.getParameter("certificateNum3") != null) {
//				sql += "certificateNum3";
//				questmark++;
//			}
//			if(multi.getParameter("registration1") != null) {
//				sql += ", registration1";
//				questmark++;
//			}
//			if(multi.getParameter("registration2") != null) {
//				sql += ", registration2";
//				questmark++;
//			}
//			if(multi.getParameter("registration3") != null) {
//				sql += ", registration3";
//				questmark++;
//			}
//			if(multi.getParameter("issuer1") != null) {
//				sql += ", issuer1";
//				questmark++;
//			}
//			if(multi.getParameter("issuer2") != null) {
//				sql += ", issuer2";
//				questmark++;
//			}
//			if(multi.getParameter("issuer3") != null) {
//				sql += ", issuer3";
//				questmark++;
//			}
//			if(multi.getParameter("issueDate1") != null) {
//				sql += ", issueDate1";
//				questmark++;
//			}
//			if(multi.getParameter("issueDate2") != null) {
//				sql += ", issueDate2";
//				questmark++;
//			}
//			if(multi.getParameter("issueDate3") != null) {
//				sql += ", issueDate3) values(?";
//				questmark++;
//			}
//			for(int i = 1; i < questmark - 1; i++) {
//				sql += ", ?";
//			}
//			sql += ")";
//			
//			pstmt = con.prepareStatement(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
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
