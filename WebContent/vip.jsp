<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.*"%>  
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
    <%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    
    %>
<base href="<%=basePath%>">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
</head>
 <style type="text/css">
 body{background-color:#666666}

 .top{margin:0 auto;background-color:#ffffff;width:90%;height:100px;}
 .logo{float:left;background-color:#fffff;height:100px;width:15%;}
   
    /* nav_menu */
.nav_menu{ float:right;height:100px;width:85%;background-color: #ffffff; }
.nav{margin:0 auto;background-color:#ffffff;height:50px;width:90%;}
.nav .list li{float:left;}
.nav .list a{float:left;display:block;width:125px;height:42px;text-align:center;font:bold 13px/36px "微软雅黑";color:#000;}
.nav .list a:hover{color:#000;}
.nav .list a:hover,.nav .list .now{color:#000;background:#CC0033;}
.nav .box{position:absolute;left:-5px;top:42px;width:1006px;background:black;overflow:hidden;height:0;filter:alpha(opacity=0);
opacity:1;border-bottom:2px solid #fff;}
.nav .cont{position:relative;padding:25px 0 0px 24px;}

    .main{margin:0 auto;background-color:#e9ecef;height:950px;width:90%;margin-top:-1%}
    .main1{float:left;background-color:#fff;height:950px;width:71%;}
    .main2{float:left;background-color:#fff;height:950px;width:29%;}
    .white{float:left;background-color:#FFFFFF;height:950px;width:1%;}
    .footer{margin:0 auto;background-color:#000000;height:100px;margin-top:25.0px;width:90%;}
    .paixu{margin:0 auto;background-color:#fff;height:70px;width:90%;margin-top:-1.0px;  box-shadow:0px 4px 5px rgba(0, 0, 0, 0.25);}
    .paixu1{margin:0 auto;height:50px;width:100%;background-color:#CC3333;  opacity:0.8;  box-shadow:0px 4px 5px rgba(0, 0, 0, 0.25);}


    .more_out{width:97%;
    		height:40px;
    	    background:#fff;
    		position:relative;
    		top:0%;
    		left:20%;
    		margin-top:50.0px;
    		margin-left:-100px;
    	
    		
    	}
 
    		
     .main2_top{
    		width:97%;
    		height:140px;
    	    background:#e9ecef;
    		position:relative;
    		top:5%;
    		left:20%;
    		margin-top:-58.5px;
    		margin-left:-100px;
    		border-bottom:1px dashed #CC3333;
        }
         .main2_next{
    		width:97%;
    		height:140px;
    	    background:#e9ecef;
    		position:relative;
    		top:5%;
    		left:20%;
    		margin-top:0%;
    		margin-left:-100px;
    		border-bottom:1px dashed #CC3333;
    		
        }

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


i{color: #eb002a;float:right; display:inline-block;}
i2{color: #999999;float:center; display:inline-block;}
i3{color: #009966;float:center; display:inline-block;}


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
.pic-chart img {
    display: block;
    margin-top:10%;
    float:left;
    max-width: 100%;
    hight:auto;    		
}

.pic-rili img {
    display: block;
    margin-top:20%;
    float:left;
    max-width: 100%;
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
.t1{width:70%;height:30%;background-color:#333333; margin-left:30%; }

.wz2{ font-weight: 800;font-size: 18px;color:black}



.container{
   max-width:150px;
   background:rgba(0, 0, 0, 0.75);
   margin-left:1%;
   padding:10px 0px 20px 0px;
   border:1px solid #111;
   border-radius:4px;
   box-shadow:0px 4px 5px rgba(0, 0, 0, 0.75);
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

 img{width:30%;height:auto;}
 </style>
<body>
 <!--头部  -->
     <div class="top">
     <div class="logo"><span class="pictures-logo"><img src="image/logo.jpg"></span></div>
     
     <div class="nav_menu">
	<div class="nav">
		<div class="list" id="navlist">
			<ul id="navfouce">
				<li><a href="index.jsp">首页</a></li>   
                <li><a href="film/keySearch.do">影片</a></li>   
                <li><a href="cinema/findAll.do">影院</a></li>
                <li><a href="personal/logout.do">登出</a></li>        	
			</ul>
		</div>

  </div>
     
     </div>
     </div>
   <!--排序  -->
   <div class="paixu">
  <div class="paixu1"> 
  </div>  </div>


   <!-- 主体部分 -->
    <div class="main">
       <div class="main2">    
<div class="container">
  <div class="link">
    <div class="text"><a href="personal/findInfo.do">个人资料</a></div>
  </div>
  <div class="link">
    <div class="text"><a href="personal/findInfo.do?target=modifyPersonal">账号设置</a></div>
  </div>
  <div class="link">
    <div class="text"><a href="order/find_order.do">查看订单</a></div>
  </div>
  <div class="link">
    <div class="text"><a href="personal/findInfo.do?vip=1">会员中心</a></div>
  </div>
  <!-- 
  <div class="link">
    <div class="text"><a href="Novip.jsp">XXXX</a></div>
  </div>
   -->
  <div class="link">
    <div class="text">联系我们</div>
  </div>
</div>

</div>  
      
       <div class="main1">
       <% UserBean user = (UserBean)request.getAttribute("user"); %>
       <table class="wz2">
       <%if(user.isVip()) { %>
       <tr><td>您已经是VIP</td></tr>
       <%} else { %>
<tr> <td>亲爱的用户：</td><td> ${user.uname }</td></tr>
<tr><td>您还不是会员</td></tr>
<tr></tr>
<tr></tr>
<tr> <td>现在成为会员</td><td>立享<span style="color:red;font-size:50px">九</span>折优惠<span style="color:red;font-size:30px">！！！</span></td></tr>
<tr> <td></td></tr>
<tr> <td>扫描二维码立即加入我们！</td><td> --------</td></tr>
<%} %>


</table>
<img src="image/bia.png">
<img src="image/zlf.jpg">
<img src="image/lmx.png">
       </div></div>




      <!-- 底部 -->
   <div class="footer"><h1>底部信息</h1></div>
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
    