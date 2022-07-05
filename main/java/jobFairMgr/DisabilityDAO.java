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
	
	// 유저 번호로 정보 갖고오기
	public DisabilityVO getUser(int userNum) {
		DisabilityVO vo = new DisabilityVO();
		Connection con = null;
		PreparedStatement pstmt = null;	
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "select * from users where userNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
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
	
	// request에 들어간 데이터를 배열로 반환
	// request로 받은 폼 데이터들을 한번에 처리할 수 있어 용이함
	// 대신 멀티파트 인코딩으로 받은 request인 경우 multi로 넘겨준 다음 파라미터를 가져올 수 있기 때문에
	// 당장은 상용화가 어려움. 방법을 조금 더 생각해보겠음
	private Map<String, String> dataIntoArr(HttpServletRequest request) throws IOException {
		Map<String, String> dataMap = new HashMap<String, String>();
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, SAVEFOLDER, MAXSIZE, ENCTYPE, new DefaultFileRenamePolicy());
		
		Enumeration params = request.getParameterNames();
		while(params.hasMoreElements()) {
		  String name = (String) params.nextElement();
		  dataMap.put(name, request.getParameter(name));
		}
		
		return dataMap;
	}
	
	// 이력서 저장
	public boolean insertResume(HttpServletRequest request) {
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
			
			sql = "insert into resume (userNum, title, militaryService, assistive,assistiveDevice, schoolName, education,"
					+ "major, institutionName1, institutionName2, institutionName3,"
					+ "period1, period2, period3, content1, content2, content3, note1, note2, note3,"
					+ "certificate1, certificate2, certificate3, certificateNum1, certificateNum2, "
					+ "certificateNum3, registration1, registration2, registration3, issuer1,"
					+ "issuer2, issuer3, issueDate1, issueDate2, issueDate3, fileName, fileSize) values("
					+ "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(multi.getParameter("userNum")));
			pstmt.setString(2, multi.getParameter("title"));
			pstmt.setString(3, multi.getParameter("militaryService"));
			pstmt.setString(4, multi.getParameter("assistive"));
			pstmt.setString(5, multi.getParameter("assistiveDevice"));
			pstmt.setString(6, multi.getParameter("schoolName"));
			pstmt.setString(7, multi.getParameter("education"));
			pstmt.setString(8, multi.getParameter("major"));
			pstmt.setString(9, multi.getParameter("institutionName1"));
			pstmt.setString(10, multi.getParameter("institutionName2"));
			pstmt.setString(11, multi.getParameter("institutionName3"));
			pstmt.setString(12, multi.getParameter("period1"));
			pstmt.setString(13, multi.getParameter("period2"));
			pstmt.setString(14, multi.getParameter("period3"));
			pstmt.setString(15, multi.getParameter("content1"));
			pstmt.setString(16, multi.getParameter("content2"));
			pstmt.setString(17, multi.getParameter("content3"));
			pstmt.setString(18, multi.getParameter("note1"));
			pstmt.setString(19, multi.getParameter("note2"));
			pstmt.setString(20, multi.getParameter("note3"));
			pstmt.setString(21, multi.getParameter("certificate1"));
			pstmt.setString(22, multi.getParameter("certificate2"));
			pstmt.setString(23, multi.getParameter("certificate3"));
			pstmt.setString(24, multi.getParameter("certificateNum1"));
			pstmt.setString(25, multi.getParameter("certificateNum2"));
			pstmt.setString(26, multi.getParameter("certificateNum3"));
			pstmt.setString(27, multi.getParameter("registration1"));
			pstmt.setString(28, multi.getParameter("registration2"));
			pstmt.setString(29, multi.getParameter("registration2"));
			pstmt.setString(30, multi.getParameter("issuer1"));
			pstmt.setString(31, multi.getParameter("issuer2"));
			pstmt.setString(32, multi.getParameter("issuer3"));
			pstmt.setString(33, multi.getParameter("issueDate1"));
			pstmt.setString(34, multi.getParameter("issueDate2"));
			pstmt.setString(35, multi.getParameter("issueDate3"));
			pstmt.setString(36, fileName);
			pstmt.setInt(37, fileSize);
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		
		return flag;
	}
	
	// 이력서 불러오기
	public ResumeVO getResume(int resumeNum) {
		ResumeVO vo = new ResumeVO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from resume where resumeNum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, resumeNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setResumeNum(Integer.parseInt(rs.getString("resumeNum")));
				vo.setUserNum(Integer.parseInt(rs.getString("userNum")));
				vo.setMilitaryService(rs.getString("militaryService"));
				vo.setAssistive(rs.getString("assistive"));
				vo.setAssistiveDevice(rs.getString("assistiveDevice"));
				vo.setSchoolName(rs.getString("schoolName"));
				vo.setEducation(rs.getString("education"));
				vo.setMajor(rs.getString("major"));
				vo.setInstitutionName1(rs.getString("institutionName1"));
				vo.setPeriod1(rs.getString("period1"));
				vo.setContent1(rs.getString("content1"));
				vo.setNote1(rs.getString("note1"));
				vo.setInstitutionName2(rs.getString("institutionName2"));
				vo.setPeriod2(rs.getString("period2"));
				vo.setContent2(rs.getString("content2"));
				vo.setNote2(rs.getString("note2"));
				vo.setInstitutionName3(rs.getString("institutionName3"));
				vo.setPeriod3(rs.getString("period3"));
				vo.setContent3(rs.getString("content3"));
				vo.setNote3(rs.getString("note3"));
				vo.setCertificate1(rs.getString("certificate1"));
				vo.setCertificateNum1(rs.getString("certificateNum1"));
				vo.setRegistration1(rs.getString("registration1"));
				vo.setIssuer1(rs.getString("issuer1"));
				vo.setIssueDate1(rs.getString("issueDate1"));
				vo.setCertificate2(rs.getString("certificate2"));
				vo.setCertificateNum2(rs.getString("certificateNum2"));
				vo.setRegistration2(rs.getString("registration2"));
				vo.setIssuer2(rs.getString("issuer2"));
				vo.setIssueDate2(rs.getString("issueDate2"));
				vo.setCertificate3(rs.getString("certificate3"));
				vo.setCertificateNum3(rs.getString("certificateNum3"));
				vo.setRegistration3(rs.getString("registration3"));
				vo.setIssuer3(rs.getString("issuer3"));
				vo.setIssueDate3(rs.getString("issueDate3"));
				vo.setTitle(rs.getString("title"));
				vo.setFileName(rs.getString("fileName"));
				vo.setFileSize(Integer.parseInt(rs.getString("fileSize")));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	// 자신이 작성한 이력서 목록 출력(제목, 이력서 고유번호) -> 이력서 관리에서 쓰일 예정
	public List<ResumeVO> getResumeList(int userNum) {
		List<ResumeVO> list = new ArrayList<ResumeVO>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select title, resumeNum from resume where userNum = ?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ResumeVO vo = new ResumeVO();
				vo.setResumeNum(Integer.parseInt(rs.getString("resumeNum")));
				vo.setTitle(rs.getString("title"));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
	
	
	// 채용공고 지원
	public boolean apply(ApplyVO vo) {
		boolean flag = false;
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = null;
        try {
        	con = pool.getConnection();
        	sql = "insert into applycom (userNum, employNum, resumeNum, progress) values(?, ?, ?, '서류심사')";
        	pstmt = con.prepareStatement(sql);
        	pstmt.setInt(1, vo.getUserNum());
        	pstmt.setInt(2, vo.getEmployNum());
        	pstmt.setInt(3, vo.getResumeNum());
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
