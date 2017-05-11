<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<%@ page import="java.sql.*, 
javax.sql.*, 
java.io.*,
javax.naming.InitialContext,
javax.naming.Context" %>
</head>
<body>
<h1>JDBC JNDI Resource Test</h1>

<%
//외부 자원을 검색하는데 사용되는 객체
InitialContext initCtx = new InitialContext();
//데이터 소스로부터 커넥션을 얻어올 수 있다. 이걸 커넥션의 집합으로 봐도 상관없다.
DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/myoracle"); //java:comp/env/는 고정! server.xml을 찾아간다.
//풀로부터 커넥션 한개를 대여하는 메서드
Connection conn = ds.getConnection();
Statement stmt = conn.createStatement();
ResultSet rset = stmt.executeQuery("select * from board");
while (rset.next()) { 
out.println("작성자 "+rset.getString("writer")); 
}
//반납하기
rset.close();
stmt.close();
conn.close();
initCtx.close();
%>
</body>
</html>