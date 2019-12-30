<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
if(session.getAttribute("uid")==null) {
    request.setAttribute("msg", "not login");
    response.sendRedirect(request.getContextPath()+"/film/index.do");
    return;
}
%>
<script type="text/javascript">
function check() {
  // alert("测试jQuery是否能用");
  //var uname = document.getElementById("uname").value;
  var email = document.getElementById("email").value;
  var oldpass=document.getElementById("oldpass").value;
  var newpass=document.getElementById("newpass").value;
  var repeatpass=document.getElementById("repeatpass").value;
  //var upwd = document.getElementById("upwd").value;
 // var rupwd = document.getElementById("rupwd").value;
  var uphone = document.getElementById("uphone").value;

  var regEmail = /^\w+@\w+((\.\w+)+)$/;
  var regName = /[a-zA-Z]\w{4,16}/;
  var regPwd = /^\w{4,10}$/;
  var regPhone = /[13,15,18]\d{9}/;

    var regPwd = /^\w{4,10}$/;
    if (email == "" || email.trim() == "") {
            document.getElementById("err_email").innerHTML = "请输入邮箱";
            return false;
          } else  if(!regEmail.test(email)) {
            document.getElementById("err_email").innerHTML = "邮箱账号@域名。如good@tom.com、whj@sina.com.cn";
            return false;
          } else {
            document.getElementById("err_email").innerHTML = "";
            if (uphone == "" || uphone.trim() == "") {
                document.getElementById("err_uphone").innerHTML = "请输入手机号";
                return false;
              } else if (!regPhone.test(uphone)) {
                document.getElementById("err_uphone").innerHTML = "手机号由11位数字组成，且以13,15,18开头";
                return false;
              } else {
                document.getElementById("err_uphone").innerHTML = "";
    if (oldpass == "" || oldpass.trim() == "") {
      document.getElementById("err_oldpass").innerHTML = "请输入密码";
      return false;
    } else if (!regPwd.test(oldpass)) {
      document.getElementById("err_oldpass").innerHTML = "格式错误";
      return false;
    } else {
      document.getElementById("err_oldpass").innerHTML = "";
      //var upwd = document.getElementById("upwd").value;
      //var relpassword = document.getElementById("relpassword").value;
       if (oldpass!=<%=request.getAttribute("upwd")%>) {
        document.getElementById("err_oldpass").innerHTML = "旧密码错误";
        return false;
      }
       else if (newpass == "" || newpass.trim() == "") {
              document.getElementById("err_newpass").innerHTML = "请输入新密码";
              return false;
            } else if (!regPwd.test(newpass)) {
              document.getElementById("err_newpass").innerHTML = "格式错误";
              return false;
            } else {
              document.getElementById("err_newpass").innerHTML = "";
        if (repeatpass == "" || repeatpass.trim() == "") {
        document.getElementById("err_repeatpass").innerHTML = "请输入密码";
        return false;
      }
       else if (repeatpass!=newpass) {
          //alert("测试jQuery是否能用");
        document.getElementById("err_repeatpass").innerHTML = "两次输入密码不一致";
        return false;
      } else {
        document.getElementById("err_repeatpass").innerHTML = "";
        //var phone = document.getElementById("phone").value;
        //var regPhone = /[13,15,18]\d{9}/;
       
         // var email = document.getElementById("email").value;
          //var regEmail = /^\w+@\w+((\.\w+)+)$/;
     
            return true;
          }
        }
      }
    }
  }
  }
  </script>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<script src="jquery/jquery.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人界面</title>
</head>

 <style type="text/css">
 body{background-color:#666666}

 .top{margin:0 auto;background-color:#ffffff;width:90%;height:100px;}
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

 </style>

<body>
 <!--头部  -->
     <div class="top">
     <div class="logo"><span class="pictures-logo"><img src="image/logo.png"></span></div>
     
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
<form action="personal/updateInfo.do" method="post">
<table class="wz2"><tr><td>个人资料</td></tr>
<tr><td>修改基本资料</td></tr>
<tr> <td>亲爱的</td><td> XXX</td></tr>
<tr></tr>
<tr></tr>
<tr> <td>当前的昵称</td><td> <input type="text" name="uname" value="${user.uname }"  id="uname" readonly/></td></tr>
<tr> <td>性别</td><td> <input type="text" name="sex" value="${user.sex }" /></td></tr>
<tr> <td>邮箱</td><td><input type="text" name="email" value="${user.email }" id="email"/><div id="err_email" style="display:inline;color:red;"></div></td></tr> 
<tr> <td>电话</td><td> <input type="text" name="uphone" value="${user.uphone }" id="uphone"/><div id="err_uphone" style="display:inline;color:red;"></div></td></tr>
<tr> <td>重置密码</td></tr>
<tr> <td>输入旧密码</td><td> <input type="text" name="oldpass" id="oldpass" /><div id="err_oldpass" style="display:inline;color:red;"></div><span id="old" ></span></td></tr>
 <tr> <td>输入新密码</td><td> <input type="text" name="newpass" id="newpass"/><div id="err_newpass" style="display:inline;color:red;"></div></td></tr>
 <tr> <td>确认新密码</td><td> <input type="text" name="repeatpass" id="repeatpass"/><div id="err_repeatpass" style="display:inline;color:red;"></div><span id="repeat" ></span></td></tr>
<tr><td><input type="submit" onclick="return check()" value="提交"></td></tr>

</table>
</form>
       
       </div></div>




      <!-- 底部 -->
   <div class="footer"><h1>底部信息</h1></div>
 <script>
//For Demo only
/*
var links = document.getElementsByClassName('link')
for(var i = 0; i <= links.length; i++)
   addClass(i)


function addClass(id){
   setTimeout(function(){
      if(id > 0) links[id-1].classList.remove('hover')
      links[id].classList.add('hover')
   }, id*750) 
}
*/
</script> 
</body>
</html>
    