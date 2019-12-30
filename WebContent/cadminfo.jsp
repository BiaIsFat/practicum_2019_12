<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@  page import="bean.*,java.util.List"%>
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
    CAdminBean cadmin = (CAdminBean)request.getAttribute("cadmin");
    pageContext.setAttribute("cinema", cadmin.getCinema());
    
%>
<base href="<%=basePath%>">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影院管理员-个人界面</title>
</head>
 <style type="text/css">
 body{background-color:#666666}

 .top{margin:0 auto;background-color:#ffffff;width:1150px;height:100px;}
 .logo{float:left;background-color:#fffff;height:100px;width:15%;}
   
    /* nav_menu */
.nav_menu{ float:right;height:100px;width:85%;background-color: #fff; }
.nav{margin:0 auto;background-color:#fff;height:50px;width:90%;}
.nav .list li{float:left;}
.nav .list a{float:left;display:block;width:125px;height:42px;text-align:center;font:bold 13px/36px "微软雅黑";color:#000;}
.nav .list a:hover{color:#fff;}
.nav .list a:hover,.nav .list .now{color:#000;background:#CC0033;}
.nav .box{position:absolute;left:-5px;top:42px;width:1006px;background:#fff;overflow:hidden;height:0;filter:alpha(opacity=0);
opacity:0;border-bottom:2px solid #fff;}
.nav .cont{position:relative;padding:25px 0 0px 24px;}

    .main{margin:0 auto;background-color:#e9ecef;height:500px;width:1150px;margin-top:-1%}
    .main1{float:left;background-color:#fff;height:500px;width:71%;}
    .main2{float:left;background-color:#fff;height:500px;width:29%;}
    
    .white{float:left;background-color:#FFFFFF;height:950px;width:1%;}
    .footer{margin:0 auto;background-color:#000000;height:100px;margin-top:25.0px;width:1150px;}
    .paixu{margin:0 auto;background-color:#fff;height:70px;width:1150px;margin-top:-1.0px;  box-shadow:0px 4px 5px rgba(0, 0, 0, 0.25);}
    .paixu1{margin:0 auto;height:50px;width:100%;background-color:#CC3333;  opacity:0.8;  box-shadow:0px 4px 5px rgba(0, 0, 0, 0.25);margin-top:-1%;}




   ul {
     list-style-type: none;
     max-height:100%;
     max-width:100%;
    }
 
    li{
      float: left;
      display:block;
      
    }
 
    a:link,
    a:visited {
    
      display: block;
      font-weight: bold;
      color: #ffffff;
      background-color: #F4F4F4;
      width: 120px;
      text-align: center;
      padding: 4px;
      text-decoration: none;
      text-transform: uppercase;
    }
 
    a:hover,
    a:active {
      background-color: #CC3333;
    }



.pictures img {
    display: block;
    top:5%;
    float:left;
    max-width: 25%;
    hight:auto;
    margin-top:2%;
    margin-buttom:-2%;
    		
}

.pictures-logo img {
    display: block;
    top:5%;
    float:left;
    max-width: 75%;
    hight:auto;
    margin-left:5%;   		
}

.t1{width:70%;height:30%;background-color:#333333; margin-left:30%; }

.wz2{margin-left:2%;margin-top:3%; font-weight: 800;font-size: 18px;color:black}



.container1{
   max-width:200px;
   background:rgba(0, 0, 0, 0.75);
   margin-left:5%;
   padding:10px 0px 20px 0px;
   border:1px solid #111;
   border-radius:4px;
   box-shadow:0px 4px 5px rgba(0, 0, 0, 0.75);
    margin-top:10px;
}
.link{
font-size:16px;
   font-weight:300;
   text-align:center;
   position:relative;
   height:40px;
   line-height:40px;
   margin-top:10px;
   overflow:hidden;
   width:90%;
   margin-left:5%;
   cursor:pointer;
}
.link:after{
   content: '';
   position:absolute;
   width:80%;
   border-bottom:1px solid rgba(255, 255, 255, 0.5);
   bottom:50%;
   left:-100%;
   transition-delay: all 0.5s;
   transition: all 0.5s;
}
.link:hover:after,
.link.hover:after{
   left:100%;
}
.link .text{
   text-shadow:0px -40px 0px rgba(255, 255, 255, 1);
   transition:all 0.75s;
   transform:translateY(100%) translateZ(0);
   transition-delay:all 0.25s;
}
.link:hover .text,
.link.hover .text{
   text-shadow:0px -40px 0px rgba(255, 255, 255, 0);
   transform:translateY(0%) translateZ(0) scale(1.1);
   font-weight:600;
}
.photo{margin:0 auto;background-color:#000000;height:100px;margin-top:25.0px;width:95%;margin-left:10px;}
.photo img{display:block;width:1150px;height:100px;float:right;}

#logout{
    height:100%;width:50px;float:right;margin-right:10%;
}

 </style>
<body>
 <!--头部  -->
     <div class="top">
     <div class="logo"><span class="pictures-logo"><img src="image/logo.jpg"></span></div>
     
   <!--<div class="nav_menu">
	<div class="nav">
		<div class="list" id="navlist">
			<ul id="navfouce">
				<li><a href="index.jsp">首页</a></li>   
				<li><a href="film/keySearch.do">影片</a></li>   
                <li><a href="cinema/findAll.do">影院</a></li>
				<li><a href="http://www.16sucai.com/">搜索</a></li>		
			</ul>
		</div>

  </div>
     
     </div>  -->  
     </div>
   <!--排序  -->
   <div class="paixu">
  <div class="paixu1">
  </div>  </div>


   <!-- 主体部分 -->
    <div class="main">
       <div class="main2">  
         
<div class="container1">

 <div class="link">
    <div class="text"><a href="personal/find_cadmin.do">管理员信息</a></div>
  </div>
  <div class="link">
    <div class="text"><a href="room/findByCadmin.do">安排场次</a></div>
  </div>
  <!--<div class="link">
     <div class="text"><a href="delcinema.jsp">安排场次</a></div> 
  </div>-->
    <div class="link">
    <div class="text"><a href="updatecinema.jsp">修改影院信息</a></div>
  </div>
  <div class="link">
    <div class="text"><a href="personal/logout.do">退出登录</a></div>
  </div>

</div>

</div>  
      
 <div class="main1">

<table class="wz2">
 
<tr><td colspan="4" ><i class="fa fa-user" aria-hidden="true"></i>  账号资料 </td></tr>
<tr></tr>
<tr><td colspan="3" >-------------------------------------------------------------------</td></tr>
<tr><td width="100px">   已登录</td><td width="200px" class="tab"><i class="fa fa-calendar" aria-hidden="true"></i> 12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;天</td></tr>
<td width="200px"></td></tr>

<tr><td width="100px">    编号:</td><td width="200px" class="tab">${requestScope.cadmin.uid }</td></tr>

<tr><td width="100px">管理的影院:</td><td>--------------------------------</td></tr>

<tr><td width="100px"></td><td width="200px" class="tab"> ${pageScope.cinema.cname } </td></tr>

<tr></tr>
<tr></tr>
<tr></tr>
<tr><td colspan="3" >-------------------------------------------------------------------</td></tr>
</table>


</div></div>

      <!-- 底部 -->
  <!-- <div class="footer"><h1>底部信息</h1></div></div> --> 

</body>
</html>
    