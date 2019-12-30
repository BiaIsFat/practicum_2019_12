<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.*"%> 
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>影院管理员-个人界面</title>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
  List<FilmBean> film_list = (List)request.getAttribute("film_list");
  List<RoomBean> room_list = (List)request.getAttribute("room_list");
  List<SessionBean> session_list = (List)request.getAttribute("session_list");
%>
<base href="<%=basePath%>">
<head> <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/16sucai.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    <div class="text"><a href="#">安排场次</a></div>
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


	<fieldset>
    	<legend>Select Session</legend>
<form action="sessionseat/plansession.do" method="post" class="niceform">
<span style="color:red">${msg }</span>
        <dl>
        	<dt><label for="fname">选择电影</label></dt>
            <dd>
            	<select size="1" name="fno" id="fname">           	
            	<!-- 这里的选项是最近上影的电影 -->
            	<%for(FilmBean film : film_list) { %>
                    <option value="<%=film.getFno()%>"><%=film.getFname() %></option>
                    <!-- <option value="速度与激情">速度与激情</option>
                    <option value="你好">你好</option>
                    <option value="你也好">你也好</option>   -->
                    <%} %>
            	</select>
            </dd>
        </dl>

              <dl>
        	<dt><label for=begin_time">开场时间:</label></dt>
            <dd><input type="text" name="begin_time" id="begin_time" size="32" maxlength="128" /></dd>
        </dl>
    
                 <dl>
        	<dt><label for="end_time">票价：</label></dt>
        	<dd><label for="end_time"><input type="text" name="price"></label></dd>
        </dl>
    
     <dl>
        	<dt><label for="rname">影厅:</label></dt>
            <dd>
            	<select size="1" name="rno" id="rname">     
            	<% for(RoomBean room : room_list) { %>      	
                    <option value="<%=room.getRno()%>"><%=room.getRname() %></option>
                    <%} %>
                    <!--  
                    <option value="4K影厅">4K影厅</option>
                    <option value="4D影厅">4D影厅</option> 
                    <option value="中国巨幕">中国巨幕</option> 
                    <option value="IMAX">IMAX</option> 
                    <option value="杜比全景声影厅">杜比全景声影厅</option> 
                    -->
            	</select>
            </dd>
        </dl>
        
   <fieldset class="action">
    	<input type="submit" name="submit" id="submit" value="Submit" />
    </fieldset>
    	</form>
   
      <fieldset >
      <legend>院线安排 的场次信息:</legend>
      <% for(SessionBean sbean : session_list) { %>
     
         <dl>
        	<dt>
        	<label>开场时间 :  <%=sbean.getBegin_time() %>   </label> </dt>

        	 <dd> <table class="wz2" >
        	 <tr><td>电影名</td><td>影厅名称</td><td>票价</td> 
        	 <td></td> </tr>
        	 <tr><td><%=sbean.getFilm().getFname() %></td><td><%=sbean.getRoom().getRname() %></td><td><%=sbean.getPrice() %></td> 
        	 <td><a href="sessionseat/findOneSession.do?sno=<%=sbean.getSno() %>">
        	 <input type="submit"  value="修改 " style="border-radius:5px;background-color:#009966;color:#fff"/>
        	 </a></td> </tr>
        	 
        	 </table></dd>
        </dl>
       
        <%} %>

            </fieldset>
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
    