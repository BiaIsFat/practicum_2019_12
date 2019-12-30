<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.*"%>  

    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
if(session.getAttribute("uid")==null) {
    request.setAttribute("msg", "not login");
    response.sendRedirect(request.getContextPath()+"/film/index.do");
    return;
}

List<OrderBean> order_list = (List)request.getAttribute("order_list");
 %>
<base href="<%=basePath%>">
 <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看订单</title>
<jsp:include page="dir.jsp" flush="true"></jsp:include>
<script>
function getGrade(ono) {
	var grades = prompt("请输入评分（0~10）");
	// grade should great than 0 and less than 10
	
	if(grades>10 || grades<0) {
		alert("请输入正确评分");
		return false;
	} else {
		window.location.href = "order/grade.do?ono="+ono+"&grades="+grades;
		return true;
	}
}
</script>
</head>
 <style type="text/css">
 body{background-color:#666666}
 .container{width:1150px;margin:0 auto;background-color:#fff;margin-top:-1%;}

    .main1{float:left;background-color:#fff;height:950px;width:35%;}
    .main2{float:left;background-color:#fff;height:950px;width:65%;}
    .white{float:left;background-color:#FFFFFF;height:auto;width:1%;}
    .footer{margin:0 auto;background-color:#000000;height:100px;margin-top:25.0px;width:1150px;}
    .paixu{margin:0 auto;background-color:#fff;height:70px;width:100%;margin-top:auto;}
    .paixu1{margin:0 auto;height:50px;width:100%;background-color:#CC3333;  opacity:0.8;}
    .search{
            margin-top:5px;
            margin-left:60%;
            width: 30%;            
            folat:right;
            display: flex;
            /*border: 1px solid red;*/
        }
        .search input{
         padding: 0;
            margin: 0;
            float: left;
            flex: 4;
            height: 30px;
            outline: none;
            border: 1px solid #CC3333;
            box-sizing: border-box;
            width:content+border*2+padding*2;
        }
        .search button{
            float: right;
            flex: 1;
            height: 30px;
            background-color: black;
            color: black;
            border-style: none;
            outline: none;
        }
        .search button i{     
            font-style: normal;
        }
        .search button:hover{
            font-size: 16px;
        }


    .more_out{
           width:97%;
    		height:40px;
    	    background:#fff;
    		position:relative;
    		top:auto;
    		left:20%;
    		margin-top:50.0px;
    		margin-left:-100px;
    	
    		
    	}
 

         .main2_next{
    		width:97%;
    		height:170px;
    	    background:#e9ecef;
    		position:relative;
    		top:5%;
    		left:18%;
    		margin-top:auto;
    		margin-left:-100px;
    		border-bottom:1px dashed #CC3333;
  }


i{color: #eb002a;float:right; display:inline-block;}
i2{color: #999999;float:center; display:inline-block;}
i3{color: #009966;float:center; display:inline-block;}


.pictures img {
    display: block;
    top:5%;
    float:left;
    max-width: 25%;
    hight:auto;
    margin-top:auto;
    margin-buttom:-2%;
    position:absolute;
}

.pictures-logo img {
    display: block;
    top:5%;
    float:left;
    width: 60%;
    hight:60%;
    margin-left:5%;   		
}
.pic-chart img {
    display: block;
    margin-top:10%;
     margin-left:5%;
    max-width: 90%;
    hight:auto;    		
}

.pic-rili img {
    display: block;
    margin-top:20%;
    margin-left:5%;
    max-width: 90%;
    hight:auto;    		
}

h4{
    display: inline-block;
    margin-left:30px;
    max-width: 100%;
    font-weight: 500;
    font-size: 16px;
    float: left;
    padding-right: 14px;
    color: #000;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
 h1{margin:0; padding:0;color:#fff;text-align:center;}
 h2{margin:0; padding:0;color:#CC3333;text-align:center;font-size:14px;font-weight:200px}
.t1{width:70%;height:30%;background-color:#333333; margin-left:20%; }
.t2{width:70%;height:70%;background-color:white; margin-left:20%;}
.t3{width:30%;height:40%;float:right;background-color:transparent;}
.t4{float:right;margin-top:50px;align:right;}
.wz1{ font-weight: 200;font-size: 10px;align:left;color:white}
.wz2{ font-weight: 800;font-size: 18px;color:white}
 </style>
<body>
 <!--头部  -->
<div class="container">
   <!--排序  -->
   <div class="paixu">
  <div class="paixu1"> 
     <div class="search">
   <input type="text" placeholder="请输入..." name="" id="" value="" />
    <button><i>搜索</i></button>
        </div>
  </div> 
  <table ><tr><td>排序：<i class="fa fa-sort-amount-asc" ></i></td>
  <td> </td> <td>按时间排序   </td><td>按金额排序</td></tr></table>
  </div>


   <!-- 主体部分 -->
 
       <div class="main2">
              <% for(OrderBean order : order_list) { %>
        <div class="main2_next">
       <a><span class="pictures"><img src="image/<%=order.getSession().getFilm().getPic()%>"></span></a> 
        <div class="t1"><div class="t3"><i class="fa fa-trash"></i></div>
        <table class="wz1"><tr><td >订单号:</td><td ><%=order.getOno() %></td></tr></table>
        <table class="wz2"><tr><td ><%=order.getSession().getCinema().getCname() %></td><td></td>
            <td><%=order.getTicket_item_list().size() %>张</td></tr></table>
        
        </div>  
       <div class="t2"><table align="left"><tr><td colspan="3" align="left"><%=order.getSession().getFilm().getFname() %></td></tr>
       <tr><td><%=order.getOtime() %></td><td>17:00-18:50</td><td><%=order.getSession().getRoom().getRtype() %></td></tr>
       <tr><td><%=order.getSession().getFilm().getType() %></td></tr>
       <tr><td><%=order.getSession().getRoom().getRname() %></td>
       <td><%for(TicketItemBean ticket:order.getTicket_item_list()){out.print(ticket.getSession_seat().getSeat().getSeatname()+" ");} %></td></tr>
       </table>
       <table class="t4" >
       <tr><span>
        <!-- 评论 -->
        <% if(order.getGrade() == 0) { %>
            <button onclick="getGrade(<%=order.getOno()%>, <%=order.getGrade()%>)">评分</button>
        <%} else { out.print(order.getGrade()); } %>
        </span> </tr>
       <tr> </tr>
       <tr> </tr>
       <tr> <td>总计:</td><td><%=order.getTotal() %></td></tr>
       <tr> <td></td><%=(order.getStatus()?"<td style=color:#009966>成功":"<td style=color:#B0C4DE>取消") %></td></tr></table></div>    
       </div>      
     
     
         <%} %>
         <div class="more_out"><h2>//查看更多</h2>
         <i class="fa fa-chevron-up"></i></div>
       </div>
       <div class="white"></div>
        <div class="main1">
        <span class="pic-chart"><img src="image/chart.png" ></span>      
        <span class="pic-rili"><img src="image/rili.png" ></span>
       </div>


      <!-- 底部 -->
   <div class="footer"><h1>底部信息</h1></div>
  </div>
</body>
</html>
    