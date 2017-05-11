<%@page import="board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! BoardDAO dao = new BoardDAO(); %> 
<% 
	//레코드 1건 삭제
	
	String board_id=request.getParameter("board_id");
	int result = dao.delete(Integer.parseInt(board_id));
	
	if(result!=0){
		out.print("<script>");
		out.print("alert('성공');");
		out.print("location.href='/board/list.jsp';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('실패');");
		out.print("history.back();"); //이전 페이지로
		out.print("</script>");
	}
%>