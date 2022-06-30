package jobFairMgr;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


@WebServlet("/disSignup")
public class DisSignupServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		DisabilityDAO dao = new DisabilityDAO();
		boolean flag = dao.insertUser(request);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(flag) {
			writer.println("<script>alert('회원가입에 성공했습니다'); location.href='login.jsp'</script>");
			writer.close();
		} else {
			writer.println("<script>alert('회원가입에 실패했습니다'); </script>");
			writer.close();
		}
		

		
		
//		PostDAO dao = new PostDAO();
//		// 카테고리를 request로 부터 받아와서 다음으로 이동할 목적지를 나눠준다
//		String category = request.getParameter("boardType");
	}
}

