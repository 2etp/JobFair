package jobFairMgr;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SaveResumeServlet")
public class SaveResumeServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		DisabilityDAO dao = new DisabilityDAO();
		
		String str = request.getParameter("userNum");
		boolean flag = dao.insertResume(request);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = response.getWriter();
		System.out.println(str);
		if(flag) {
			writer.println("<script>alert('이력서를 저장했습니다.'); location.href='myPageForDisability.jsp'</script>");
			writer.close();
		} else {
			writer.println("<script>alert('이력서를 저장하지 못했습니다.'); location.href='postResume.jsp'</script>");
			writer.close();
		}
	}
}
