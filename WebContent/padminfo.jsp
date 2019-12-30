<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.*"%> 
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    
    List<FilmBean> cinemabean = (List)request.getAttribute("film");
    if(session.getAttribute("account")==null) {
        request.setAttribute("msg", "not login");
        response.sendRedirect(request.getContextPath()+"/film/index.do");
        return;
    }
    PAdminBean padminbean = (PAdminBean)request.getAttribute("padminbean");
    
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

 </style>
<body>
 <!--头部  -->
    
   <!--排序  -->
   <div class="paixu">
  <div class="paixu1"> 
  </div>  </div>


   <!-- 主体部分 -->
    <div class="main">
       <div class="main2">  
         
<div class="container1">

 <div class="link">
    <div class="text"><a href="padminfo.jsp">管理员信息</a></div>
  </div>
  <!-- 
  <div class="link">
    <div class="text"><a href="filmadm.jsp">电影管理</a></div>
  </div>
   -->
  <div class="link">
    <div class="text"><a href="upfilm.jsp">上架电影</a></div>
  </div>
    <div class="link">
    <div class="text"><a href="film/keySearch.do">下架电影</a></div>
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



<tr></tr>
<tr></tr>
<tr></tr>
<tr><td colspan="3" >-------------------------------------------------------------------</td></tr>
</table>
<span style="color:red;font-size:30px" >
${msg }
</span>

</div></div>

      <!-- 底部 -->
  
 <script>
//For Demo only
    var links = document.getElementsByClassName('link')
    for(var i = 0; i <= links.length; i++)
    addClass(i)


function addClass(id){
   setTimeout(function(){
      if(id > 0) links[id-1].classList.remove('hover')
      links[id].classList.add('hover')
   }, id*750) 
}

</script> 
</body>
</html>
    