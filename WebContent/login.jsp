<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
if(session.getAttribute("uid")!=null) {
    request.getRequestDispatcher("/index.jsp").forward(request, response);
    return;
}
%>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
 <style type="text/css">
 body{background-color:#666666;}
 .container{margin:0 auto;width:1150px;}
 .main{margin:0 auto;margin-top:5%;width:1000px;height:500px;background-color:#ffffff;}
 .mainl{float:left;width:48%;height:500px;background-color:#fff;position: relative;}
 .mainr{float:right;width:52%;height:500px;background-color:#fff;position: relative;}

 .show{width:100%;height:500px;background-color:#fff;}
 .show img{width:100%;height:100%;position: relative;}
 .ta{max-width:90%;height:auto;margin:0 auto;margin-top:15%;collspacing:10px;border-radius: 4px;border-spacing:10px 30px; }
 h1{margin:0 auto;margin-top:20%;margin-left:10%;}
     .m_2 {color: #CC0033;font-size: 1.0em;text-transform: uppercase;font-weight: 600;text-align:center;margin-top:10%}
.buttom{display: block;
    z-index: 2;
    text-shadow: none;
    margin: 0;
    max-width: none;
    position: absolute;
    top: 58%;
    right: 15%;}
    .button a {
    text-decoration: none;
    color: #fff;
    background: #d8232a;
    padding: 8px 20px;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -o-border-radius: 5px;
    text-transform: uppercase;
    font-weight: 600;
    font-size: 1.2em;
}
.cover{margin:0 auto;float:right;width:40%;height:300px;background-color:#000;margin-top:20%;margin-left:10%;}
 </style>
 <body>
 
<div class="container">
    <div class="main">
       <div class="mainl">
          <span class="show">
            <img src="image/city.jpg"></span></div>    
      <div class="mainr">
      <h1>WELCOME TO ISEE.COM</h1>
      <span style="color:red;font-size:10px">${msg}</span>
      <form action="personal/goLogin.do" method="post">
      <table class="ta" >
      <tr> 
      <td><i class="fa fa-user-circle-o" ></i> </td>
      <td class="m_2"> 账号</td>
      <td> <input style="border-radius:5px" type="text" name="uname"  placeholder="请输入用户名/手机号"  /></td>
      </tr>
      <tr> 
      <td> <i class="fa fa-key" ></i></td>
      <td class="m_2"> 密码</td>
      <td> <input style="border-radius:5px" type="password" name="upwd"  placeholder="请输入密码" /></td>
      </tr>   
       <tr> 
       <td></td> 
           <td>选择身份</td> 
        <td><input id="uid" type="radio" checked="checked" name="identify" value="0"/>用户
            <input id="account" type="radio"  name="identify" value="1"/>影院管理员
            <input id="account" type="radio"  name="identify" value="2"/>平台管理员</td>
       </tr>
       <tr><td></td><td></td>
       <td><input type="submit" value="确认登录"/> <a href="register.jsp">Sign Up</a> </td>
       </tr> 
      </table> 
       </form>     
      </div>
    </div>
  
  </div>
</body>
</html>