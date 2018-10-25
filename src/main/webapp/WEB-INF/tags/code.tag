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
