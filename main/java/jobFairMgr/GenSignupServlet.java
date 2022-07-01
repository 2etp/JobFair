package jobFairMgr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/GenSignup")
public class GenSignupServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		generalDAO dao = new generalDAO();
		boolean flag = dao.insertGeneral(request);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		if(flag) {
			writer.println("<script>alert('회원가입에 성공했습니다'); location.href='login.jsp'</script>");
			writer.close();
		} else {
			writer.println("<script>alert('회원가입에 실패했습니다'); location.href='login.jsp'</script>");
			writer.close();
		}
	}
}
