<%@page import="board.model.Board"%>
<%@page import="board.model.BoardDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%! BoardDAO dao = new BoardDAO(); %>
<%
	request.setCharacterEncoding("utf-8");
	String board_id=request.getParameter("board_id");
	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	Board dto = new Board();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setBoard_id(Integer.parseInt(board_id));
	
	int result=dao.update(dto);
	
	if(result!=0){
		out.print("<script>");
		out.print("alert('수정했습니다.');");
		out.print("location.href='/board/detail.jsp?board_id="+board_id+"';");
		out.print("</script>");
	}else{
		out.print("<script>");
		out.print("alert('실패했습니다..');");
		out.print("history.back();");
		out.print("</script>");
	}

%>
