<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
 <style type="text/css"> 
   body{background-color:#666666;}

 .container{margin:0 auto;width:1000px;height:500px;}
 .main{margin:0 auto;margin-top:10%;width:1000px;height:500px;background-color:#000;}
 .mainl{float:left;width:100%;height:450px;background-color:#fff;position: relative;top:5%}

 .mainb{float:left;width:100%;height:80px;background-color:#000top:85%}
 .kuai{float:left; margin-left:2%;width:50px;height:50px;background-color:#fff;top:100%;}
 .show{width:100%;height:500px;background-color:#fff;}
 .show img{width:100%;height:100%;position: relative;}
 
 .ta{border-spacing:5px 8px; max-width:90%;height:auto;margin:0 auto;margin-top:1%;collspacing:10px; bordercolor:#F4F4F4;margin-left:5%;}
 h1{margin:0 auto;margin-top:2%;margin-left:10%;}
.m_1{color: #CC0033;font-size: 1.0em;text-transform: uppercase;font-weight: 600;text-align:left;margin-top:1%}
     
 .m_2 {font-family:"微软雅黑";color: #CC0033;font-size: 1.0em;text-align:left;margin-top:2%;margin-left:1%;}
.uppic{display:block;vertical-align:right}
.uppic img{width:400px;height:auto;float:right;margin-right:40px;margin-top:20px;}

 </style>
 <script type="text/javascript">

function check() {
    //alert("测试jQuery是否能用");
  var uname = document.getElementById("uname").value;
  var upwd = document.getElementById("upwd").value;
  var rupwd = document.getElementById("rupwd").value;
  var uphone = document.getElementById("uphone").value;
  var email = document.getElementById("email").value;
  var regEmail = /^\w+@\w+((\.\w+)+)$/;
  var regName = /[a-zA-Z]\w{4,16}/;
  var regPwd = /^\w{4,10}$/;
  var regPhone = /[13,15,18]\d{9}/;
  
  if (uname=="" || uname.trim()=="") {
    
    document.getElementById("err_uname").innerHTML = "请输入用户名";
    return false;
  } else if (!regName.test(uname)) {

    document.getElementById("err_uname").innerHTML = "由英文字母和数字组成的4-16位字符，以字母开头";
    return false;
  } else {
    document.getElementById("err_uname").innerHTML = "ok";
    //var regPwd = /^\w{4,10}$/;
    if (upwd == "" || upwd.trim() == "") {
      document.getElementById("err_upwd").innerHTML = "请输入密码";
      return false;
    } else if (!regPwd.test(upwd)) {
      document.getElementById("err_upwd").innerHTML = "格式错误";
      return false;
    } else {
      document.getElementById("err_upwd").innerHTML = "ok!!!";
      //var upwd = document.getElementById("upwd").value;
      //var relpassword = document.getElementById("relpassword").value;
      if (rupwd == "" || rupwd.trim() == "") {
        document.getElementById("err_rupwd").innerHTML = "请输入密码";
        return false;
      }
       else if (rupwd!=upwd) {
          //alert("测试jQuery是否能用");
        document.getElementById("err_rupwd").innerHTML = "两次输入密码不一致";
        return false;
      } else {
        document.getElementById("err_rupwd").innerHTML = "ok!!!";
        //var phone = document.getElementById("phone").value;
        //var regPhone = /[13,15,18]\d{9}/;
        if (uphone == "" || uphone.trim() == "") {
          document.getElementById("err_uphone").innerHTML = "请输入手机号";
          return false;
        } else if (!regPhone.test(uphone)) {
          document.getElementById("err_uphone").innerHTML = "手机号由11位数字组成，且以13,15,18开头";
          return false;
        } else {
          document.getElementById("err_uphone").innerHTML = "ok!!!";
         // var email = document.getElementById("email").value;
          //var regEmail = /^\w+@\w+((\.\w+)+)$/;
          if (email == "" || email.trim() == "") {
            document.getElementById("err_email").innerHTML = "请输入邮箱";
            return false;
          } else  if(!regEmail.test(email)) {
            document.getElementById("err_email").innerHTML = "邮箱账号@域名。如good@tom.com、whj@sina.com.cn";
            return false;
          } else {
            document.getElementById("err_email").innerHTML = "ok!!!";
            return true;
          }
        }
      }
    }
  }
}

</script>
 <body>
 
<div class="container">
   <div class="main"> 
    <div class="mainl"> <div class="uppic">
  <span ><img src="image/dianti.jpg"/></span>  
      <h1>WELCOME TO ISEE.COM</h1>
      <ul>
      <li class="m_1">JOIN US</li></ul>
  
  <form  action="personal/signUp.do" method="post">
     <table class="ta">
         <tr>
             <td><i class="fa fa-user-circle-o" ></i></td><td class="m_2">账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</td>
             <td>
                 <input style="border-radius:5px" type="text" name="uname" id="uname" placeholder="由英文字母和数字组成的4-16位字符，以字母开头"/>
                 <div id="err_uname" style="display:inline;color:red;"></div>
             </td>
         </tr>
         <tr>
             <td> <i class="fa fa-key" ></i></td><td class="m_2">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
             <td>
                 <input style="border-radius:5px" type="password" name="upwd" id="upwd"  placeholder="由英文字母和数字组成的4-10位字符">
                 <div id="err_upwd" style="display:inline;color:red;"></div>
             </td>
         </tr>
         <tr>
            <td> </td> <td class="m_2">确认密码：</td>
             <td>
                 <input style="border-radius:5px" type="password" name="rupwd" id="rupwd"  placeholder="确认密码">
                 <div id="err_rupwd" style="display:inline;color:red;"></div>
             </td>
         </tr>
         <tr>
             <td><i class="fa fa-phone" ></i></td><td class="m_2">电话号码：</td>
            <td><input style="border-radius:5px" type="text" name="uphone" id="uphone" placeholder="手机号由11位数字组成，且以13,15,18开头">
            <div id="err_uphone" style="display:inline;color:red;"></div>
            </td>
        </tr>
         <tr>
            <td> <i class="fa fa-envelope-o" ></i></td><td class="m_2">电子邮件：</td>
             <td><input style="border-radius:5px" type="text" name="email" id="email" placeholder="邮箱账号@域名。如good@tom.com、whj@sina.com.cn">
             <div id="err_email" style="display:inline;color:red;"></div>
             </td>
         </tr>
           <tr> <td> <i class="fa fa-child"></i></td><td class="m_2"> 性别
               <td><input id="man" type="radio" checked="checked" name="sex" value="M"/>男
               <input id="woman" type="radio"  name="sex" value="F"/>女</td>
           </tr>
         <tr>
             <td colspan="1">
             </td>
             <td>
               <input type="submit" value="注册" onclick="return check()"/>
                <input type="reset" value="重置"/>
                <a href="login.jsp" target="_blank">登陆</a>
            </td>
        </tr>
    </table>
 </form>
  </div>  
  </div>
  <div class="mainb">
  <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div> <div class="kuai"></div>
   <div class="kuai"></div> <div class="kuai"></div>
  </div></div></div>
 
</body>
</html>