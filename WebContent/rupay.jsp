<%@ page language="java" import="java.util.*,daoImpl.*,bean.*"
	pageEncoding="utf-8"%>

<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
if(session.getAttribute("uid")==null){
    pageContext.setAttribute("msg", "not login!");
}
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
	<base href="<%=basePath%>">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>付款</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

</head>
 <style type="text/css"> 
   body{background-color:#666666;}

 .container{margin:0 auto;width:800px;height:auto;background-color:#000;border-radius:10px}
 .main{margin:0 auto;margin-top:5%;width:700px;height:auto;background-color:#FF6666;border-radius:10px}
 .mainl{margin:0 auto;width:600px;height:auto;background-color:#fff;position: relative;top:5%}

 .del{border-radius:5px;background-color:#CC3333;color:#fff;}
 .upda{border-radius:5px;background-color:#009966;color:#000";text-align:right;}
 
 h1{margin:0 auto;margin-top:2%;text-align:center;}
.m_1{color: #CC0033;font-size: 1.0em;text-transform: uppercase;font-weight: 600;text-align:left;margin-top:1%}
     
 .m_2 {font-family:"微软雅黑";color:#FF9933;font-size: 18px;text-align:left;}

.tick{vertical-align:right ;margin-top:20px;margin-left:30%;;width:700px;height:auto;}
 </style>

 <body>
 
<div class="container">
   <div class="main"> 
    <div class="mainl"> 
      <h1>DO YOU WANT TO BUY IT</h1>
      <ul>
      <li style="color:#CC0033;">生成您的订单 ${msg }</li></ul>
  
<form action="order/addOrder.do" method="post"> 	<% 
	List<SessionSeatBean> seat_list = (List)request.getAttribute("seat_list"); 
	%>
	<fieldset >        
        <dl>
        	<dt><label for="cinema">Cinema:${cinema.cname }</label></dt>
        </dl> 
        <dl>
        	<dt><label for="fname">Film:${film.fname }</label>
        	<input type="hidden" name="fno" value="${film.fno }" size="32" maxlength="128" /></dt>
       </dl>
        <dl>
        	<dt><label for="Begin time">Begin Time:${session.begin_time }</label>
            <input type="hidden" name="sno" value="${session.sno }" size="32" maxlength="32" /></dt>
        </dl>       
        <dl>
        	<dt><label for="End Time">End Time:${session.end_time }</label>
        </dl>
          <dl>
        	<dt><label for="Room">Room:${room.rname }</label>
        </dl>
        <dl>
        	<dt><label for="Seat">Seat:<% for (SessionSeatBean ssbean : seat_list) {
	       out.print(ssbean.getSeat().getSeatname()+"<br/>");
	       %></label>
            <input type="hidden" name="ssno" value="<%=ssbean.getSsno()%>" size="32" maxlength="32" /><%}%></dt>
        </dl>
           <dl>
        	<dt class="w_2"><label for="Price">Price:${total }</label>
            <input type="hidden" name="total" value="${total }"size="32" maxlength="32" /></dt>
        </dl>
    </fieldset> 
    <fieldset class="action">
    	<input type="submit" name="submit" id="submit" value="现在支付"  class="upda"/>
    	<button onclick="javascript:history.go(-1)" class="del">取消</button>
    </fieldset>
</form>
 
  </div>  
  </div>
</div>

</body>
</html>

