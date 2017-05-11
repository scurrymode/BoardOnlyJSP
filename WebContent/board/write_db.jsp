<%@page import="board.model.BoardDAO"%>
<%@page import="board.model.Board"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	BoardDAO dao = new BoardDAO();
%>

<% 
	//클라이언트가 전송한 parameter 값들을 이용하여 오라클에 넣자~!!
	request.setCharacterEncoding("utf-8");
	
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	Board dto = new Board();
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setContent(content);
	
	int result = dao.insert(dto);
	if(result!=0){
		out.print("<script>");
		out.print("alert('성공');");
		out.print("location.href='/board/list.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('실패');");
		out.print("history.back();");
		out.print("</script>");
	}

%>