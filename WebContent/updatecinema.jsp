<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影院管理员-个人界面</title>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
  
%>
<base href="<%=basePath%>">
</head>
 <style type="text/css">
 body{background-color:#666666}



    .main{margin:0 auto;background-color:#fff;height:1200px;width:1150px;margin-top:-1%}
    .main1{float:left;background-color:#fff;height:1000px;width:80%;}
    .main2{float:left;background-color:#fff;height:1000px;width:20%;}
    
    .white{float:left;background-color:#FFFFFF;height:950px;width:1%;}
    .footer{margin:0 auto;background-color:#000000;height:100px;margin-top:-30.0px;width:1150px;}
    .paixu{margin:0 auto;background-color:#fff;height:70px;width:1150px;margin-top:-1.0px;  box-shadow:0px 4px 5px rgba(0, 0, 0, 0.25);}
    .paixu1{margin:0 auto;height:50px;width:100%;background-color:#CC3333;  opacity:0.8;  box-shadow:0px 4px 5px rgba(0, 0, 0, 0.25);margin-top:-1%;}

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

.wz2{margin-left:-1%;margin-top:1%; font-weight: 800;font-size: 18px;color:black;
text-align:center;
collspacing:20px;border-spacing:90px 10px;}

.tab{text-align:left;width:300px;border-radius:5px; }


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
.link1{
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
.link1:after{
   content: '';
   position:absolute;
   width:80%;
   border-bottom:1px solid rgba(255, 255, 255, 0.5);
   bottom:50%;
   left:-100%;
   transition-delay: all 0.5s;
   transition: all 0.5s;
}
.link1:hover:after,
.link1.hover:after{
   left:100%;
}
.link1 .text{
   text-shadow:0px -40px 0px rgba(255, 255, 255, 1);
   transition:all 0.75s;
   transform:translateY(100%) translateZ(0);
   transition-delay:all 0.25s;
}
.link1:hover .text,
.link1.hover .text{
   text-shadow:0px -40px 0px rgba(255, 255, 255, 0);
   transform:translateY(0%) translateZ(0) scale(1.1);
   font-weight:600;
}


   .link1 a:link,
   .link1 a:visited {
    
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
 
   .link1 a:hover,
  .link1  a:active {
      background-color: #CC3333;
    }
  



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

 <div class="link1">
    <div class="text"><a href="personal/find_cadmin.do">管理员信息</a></div>
  </div>
  <div class="link1">
    <div class="text"><a href="room/findByCadmin.do">安排场次</a></div>
  </div>
  <!--<div class="link">
     <div class="text"><a href="delcinema.jsp">安排场次</a></div> 
  </div>-->
    <div class="link1">
    <div class="text"><a href="updatecinema.jsp">修改影院信息</a></div>
  </div>
  <div class="link1">
    <div class="text"><a href="personal/logout.do">退出登录</a></div>
  </div>

</div></div>

<div class="main1"> 


<form action="#" method="post" class="niceform">
	<fieldset>
    	<legend>Select Session</legend>

         <dl>
        	<dt><label for="cname">影院名称:</label></dt>
            <dd><input type="text" name="cname" id="cname" size="32" maxlength="128" /></dd>
        </dl>

              <dl>
        	<dt><label for="addr">地址:</label></dt>
            <dd><input type="text" name="addr" id="addr" size="32" maxlength="128" /></dd>
        </dl>
   
   
     <dl>
        	<dt><label for="worktime">营业时间:</label></dt>
            <dd><input type="text" name="worktime" id="worktime" size="32" maxlength="128" /></dd>
        </dl>
    
       <dl>
        	<dt><label for="tel">联系电话:</label></dt>
            <dd><input type="text" name="tel" id="tel" size="32" maxlength="128" /></dd>
        </dl>
    
   
   
        
   <fieldset class="action">
    	<input type="submit" name="submit" id="submit" value="确认修改" />
    </fieldset>
   
      <fieldset >
      <legend>影院信息:</legend>
         <dl>

        	 <dd> <table class="wz2" >
        	 <tr><td width="110px">影院名</td><td  width="50px">地址</td><td  width="110px">营业时间</td> <td width="90px">联系电话</td>
        	      	 <td><a href="updatesee.jsp"><input type="submit"  value="修改 " style="border-radius:5px;background-color:#009966;color:#fff"/></a></td> </tr>
 
        	 </table></dd>
        </dl>
        
     
        
            </fieldset>
</form>
</div>

</div>


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
    