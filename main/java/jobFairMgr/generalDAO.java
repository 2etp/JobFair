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
}
