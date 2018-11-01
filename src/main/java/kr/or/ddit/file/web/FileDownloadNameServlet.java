package kr.or.ddit.file.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fileDownloadName")
public class FileDownloadNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FileDownloadNameServlet() {
        super();
    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//파일에 대한 정보(파일명 등) : header
		//응답에 대한 정보(html이 아니라 바이너리 파일) : contentType
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition","attachmen; filename=git.txt");
		
		File f = new File("D:\\A_TeachingMaterial\\6.JspSrpgin\\upload\\git.txt");
		
		FileInputStream fis = new FileInputStream(f);
		byte[] buffer =  new byte[512];
		int len =0;
		
		ServletOutputStream sos = response.getOutputStream();
		
		//파일을 읽기
		while((len = fis.read(buffer)) !=-1){
			//파일 쓰기
			sos.write(buffer,0,len);
		}
		sos.close();
		fis.close();
	}

}
















