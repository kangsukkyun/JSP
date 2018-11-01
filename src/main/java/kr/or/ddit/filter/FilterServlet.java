package kr.or.ddit.filter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/filterServlet")

// http://localhost:8081/filterServlet
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FilterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("filter servlet doGet");
		
		request.getRequestDispatcher("/filter/view.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//글씨가 안 깨지게 하기 위해서 사용
		//character encoding 설정을 filter로 이관(코드 중복 제거)
		//request.setCharacterEncoding("utf-8");
		
		//userNm파라미터 받기
		String userNm = request.getParameter("userNm");
		
		//request 속성으로 저장
		request.setAttribute("userNm", userNm);
		
		//request forward (/filter/view.jsp)
		request.getRequestDispatcher("/filter/view.jsp").forward(request, response);
		
		//view.jsp request객체의 userNm이라고 설정한 속성을 화면에 표시
	}

}









