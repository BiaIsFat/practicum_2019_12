<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
 <style type="text/css">
 body{background-color:#666666;}
   h1{margin:0; padding:0;color:#fff;text-align:center;}
   
    .top{margin:0 auto;padding:0; background-color:#fff;width:1150px;height:100px;top:20;;margin-top:-1%;;}
    .logo{float:left;background-color:#fff;height:100px;width:20%;}
    .header{float:right;background-color:#000;height:100px;width:80%;} 
    
       /* nav_menu */
       
       
.nav_menu{ float:right;height:100px;width:100%;background-color: #fff }


.nav{margin-left:5%;background-color:#fff;height:50px;width:80%;}


.nav .list li2{float:left;list-style:none;margin-right:8%;margin-top:3%;height:50px;width:100px;}


<!-- 字体颜色-  -->
.nav .list a{float:left;display:block;width:125px;
height:42px;text-align:center;font:bold 13px/36px "微软雅黑";color:#CC3333;}




.nav .list a:hover,.nav .list .now
{color:#000;background:#CC3333;}



.nav .box{position:absolute;left:-5px;top:80px;width:80%;background:#FFC;
overflow:hidden;height:0;filter:alpha(opacity=0);
opacity:0;border-bottom:2px solid #fff;}


.nav .cont{position:relative;padding:25px 0 0px 24px;}
  
  .nav  a:link, a:visited {
    
      display: block;
      font-weight: bold;
      color: #000;
      background-color: #fff;
      text-align: center;
      padding: 4px;
      text-decoration: none;
      text-transform: uppercase;
    }
 
   .nav a:hover,a:active {
      background-color: #CC3333;
    }  
    
    .hang{dispaly:line-block;margin-top:27px;float:right;background-color:#CC3333;height:50px;width:50px;} 
    .main{margin:0 auto;background-color:#FFF;height:320px;width:100%;margin-top:auto;}
    .main1{margin-top:27px;float:left;background-color:#F4F4F4;height:300px;width:30%;}
    .main2{margin-top:27px;float:left;background-color:#F4F4F4;height:300px;width:40%;}
    .main3{margin-top:27px;float:right;background-color:#F4F4F4;height:300px;width:30%;}
    .m_1{ font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;}
     <!--图片  -->
    .bannerpic {display: block; float: none; position: absolute; opacity: 0; transition: opacity 500ms ease-in-out 0s; z-index: 1;}
    .banner img { margin:0 auto;margin-top:-1%;max-width: 100%;hight:auto; 		}
    .pictures-logo img 
    {display: block; margin-top:2%; max-width: 40%; margin-left: 20%; hight:auto; }   
   .hanglogin li2{float:left;list-style:none;margin-right:8%;margin-top:3%;height:50px;width:50px;}  
   li2.hangloin{width:270px}
   
   
 </style>
<body>
   <!--头部  -->
     <div class="top">
     <div class="logo"><span class="pictures-logo"><img src="image/logo.png"></span></div>
     <div class="header">  
     <div class="nav_menu">
	<div class="nav">
		<div class="list" id="navlist">
			<ul id="navfouce">
				<li2 ><a href="film/index.do">首页</a></li2>   
				<li2><a href="film/keySearch.do">影片</a></li2>   
                <li2><a href="cinema/findAll.do">影院</a></li2>
				<li2 class="hanglogin">
   <% if(session.getAttribute("uid")==null) { %>
   <a href="login.jsp">登录</a>
   <%} else { %>
   <a href="personal/findInfo.do" class="logged"><%=session.getAttribute("uname") %></a>
   <a href="personal/logout.do" class="logged">退出登录</a>
   <%} %>
   </li2>	
			</ul>
			
		</div>
     </div>
     </div>
     </div>
     </div>

</body>
</html>
    