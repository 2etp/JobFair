package jobFairMgr;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		if(type.equals("Disability")) {
			DisabilityDAO dao = new DisabilityDAO();
			dao.insertUser(request);
			response.sendRedirect("login.jsp");
		} else {
			generalDAO dao = new generalDAO();
			dao.insertGeneral(request, response);
			
		}
		
//		PostDAO dao = new PostDAO();
//		// 카테고리를 request로 부터 받아와서 다음으로 이동할 목적지를 나눠준다
//		String category = request.getParameter("boardType");
	}
}

