<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
%>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery/jquery.js"></script>
<script>
$("#replyForm").submit(function(){  
    window.close();  
});   
</script>
</head>
<body>

<form action="personal/addcomment.do" method="post" id="replyForm">
<input type="hidden" value="<%=request.getParameter("cno") %>" name="replyno">
<input type="hidden" value="<%=request.getParameter("fno") %>" name="fno">
<textarea name="content" placeholder="@<%=request.getParameter("name") %>"></textarea>
<input type="submit" value="reply">
</form>

</body>
</html>