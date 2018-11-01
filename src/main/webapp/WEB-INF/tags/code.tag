<%@tag import="java.sql.ResultSet"%>
<%@tag import="java.sql.Statement"%>
<%@tag import="java.sql.SQLException"%>
<%@tag import="java.sql.DriverManager"%>
<%@tag import="java.sql.Connection"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="code" type="java.lang.String" required="true" %>

<br>
code : ${code}	

<br>

<%-- 
<%
// 작업하기 전에 JDBC드라이버를 Build Path에 추가한다.

		// DB작업에 필요한 객체변수 선언
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521:xe", "pc22", "java");
			
			stmt = conn.createStatement();
			
			String code = (String)jspContext.getAttribute("code");
			
			String sql = "";
			sql += " Select ";
			sql += " prod_id, prod_name ";
			sql += " from prod ";
			sql += " where prod_lgu=";
			sql += "'"+code+"'";
			
			rs = stmt.executeQuery(sql);
%>
	<select>
<%
			while(rs.next()){
%>
		<option value="<%=rs.getString("prod_id")%>"><%=rs.getString("prod_name") %></option>
<% 			
			}
%>
	</select>
<% 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	
%>	
 --%>
<%
	// DB작업에 필요한 객체변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;   // 쿼리문이 select일때만 필요하다.
	String studentName = "";
	try {
		// 1. JDBC 드라이버 로딩 ==> Class.forName()을 이용한다.
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. 해당 DB에 접속하기 
		//		==> DriverManager.getConnection()을 이용하고
		//		==> 접속이 성공하면 Connection객체가 생성된다.
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "sem";  // 등록된 사용자 ID
		String pass = "java"; // 등록된 패스워드
		
		conn = DriverManager.getConnection(url, user, pass);
		
		
		stmt = conn.createStatement();
		
		
		StringBuffer sql = new StringBuffer();
					sql.append(" select prod_id, prod_name ");
					sql.append(" from prod ");
					sql.append(" where prod_lgu = '" + code + "'" );
		
		rs = stmt.executeQuery(sql.toString());  // sql명령이 select일 경우
	
		
		out.write("<select>");
		
		while(rs.next()){
			out.write("<option value='" + rs.getString("prod_id") + "'>" 
							+ rs.getString("prod_name") +
					  "</option>");
		}
		out.write("</select>");
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} finally{
		// 6. 사용했던 자원을 반납한다.
		if( rs!=null ) try { rs.close(); } catch (Exception e2){}
		if( stmt!=null ) try { stmt.close(); } catch (Exception e2){}
		if( conn!=null ) try { conn.close(); } catch (Exception e2){}
	}
%>