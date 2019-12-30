<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";

%>
<base href="<%=basePath%>"> 

<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>影院管理员-个人界面</title>
</head>
 <style type="text/css">
 body{background-color:#666666}

   
    /* nav_menu */

.main{margin:0 auto;background-color:#fff;height:auto;width:1150px;}
    .main1{float:left;background-color:#fff;height:900px;width:71%;}
    .main2{float:left;background-color:#fff;height:900px;width:29%;}
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

.wz2{margin-left:1%;margin-top:5%; font-weight: 800;font-size: 18px;color:black;text-align:center;}
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
    height:auto;
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

 <div class="main"> 
   <!--排序  -->
   <div class="paixu">
  <div class="paixu1"> 
  </div>  </div>


   <!-- 主体部分 -->
  
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
 
<form action="film/addFilm.do" method="post" class="niceform" enctype="multipart/form-data">
	<fieldset>
    	<legend>Film Info</legend>
    	<span style="color:red;font-size:10px">${msg}</span>
        <dl>
        	<dt><label for="fname">电影名称:</label></dt>
            <dd><input type="text" name="fname" id="fname" size="32" maxlength="128" /></dd>
        </dl>
        <dl>
        	<dt><label for="actor">主演名单</label></dt>
            <dd><input type="text" name="actor" id="actor" size="32" maxlength="32" /></dd>
        </dl>
        
         <dl>
        	<dt><label for="intro">电影简介</label></dt>
            <dd><input type="text" name="intro" id="intro" size="32" maxlength="32" /></dd>
        </dl>
        
        <dl>
        	<dt><label for="country">发行国家</label></dt>
            <dd><input type="text" name="country" id="country" size="32" maxlength="32" /></dd>
        </dl>
        
              <dl>
        	<dt><label for="duration">播放时长（分钟）</label></dt>
            <dd><input type="text" name="duration" id="duration" size="32" maxlength="32" /></dd>
        </dl>
        
             <dl>
        	<dt><label for="view">视觉效果</label></dt>
            <dd>
            	<select size="1" name="view" id="view">
                  
                    <option value="2D">2D</option>
                    <option value="3D">3D</option>
                    <option value="IMAX">IMAX</option>
                    <option value="4D">4D</option>
            	</select>
            </dd>
        </dl>
        
        <dl>
        	<dt><label for="type">电影类型</label></dt>
            <dd>
            	<select size="1" name="type" id="type">
                    <option value="动作"> 动作</option>
                    <option value="奇幻">奇幻</option>
                    <option value="喜剧">喜剧</option>
                    <option value="恐怖">恐怖</option>
                    <option value="冒险">冒险</option>
                    <option value="爱情">爱情</option>
                    <option value="警匪">警匪</option>
                    <option value="科幻">科幻</option>
                    <option value="战争">战争</option>
                    <option value="悬疑">悬疑</option>
                    <option value="纪录">纪录</option>
                    <option value="动画">动画</option>
                    <option value="惊悚">惊悚</option>
                    <option value="超级英雄">超级英雄</option>
            	</select>
            </dd>
        </dl>

        
        <dl>
        	<dt><label for="ontime">上映日期:</label></dt>
            <dd>
            <select size="1" name="dobYear" id="dobYear">
                    <option value="2023-">2023</option>
                    <option value="2022-">2022</option>
                    <option value="2021-">2021</option>
                    <option value="2020-">2020</option>
                    <option value="2019-">2019</option>
                    <option value="2018-">2018</option>
                    <option value="2017-">2017</option>
                    <option value="2016-">2016</option>
                </select>
            	<select size="1" name="dobMonth" id="dobMonth">
                	<option value="01-">1月</option>
                    <option value="02-">2月</option>
                    <option value="03-">3月</option>
                    <option value="04-">4月</option>
                    <option value="05-">5月</option>
                    <option value="06-">6月</option>
                    <option value="07-">7月</option>
                    <option value="08-">8月</option>
                    <option value="09-">9月</option>
                    <option value="10-">10月</option>
                    <option value="11-">11月</option>
                    <option value="12-">12月</option>
                </select>
                <select size="1" name="dobDay" id="dobDay">
                	<option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                </select>
                
            </dd>
        </dl>
    </fieldset>
    <fieldset>
    	<legend>picture of film</legend>
            <dl>
        	<dt><label for="pic">上传电影海报:</label></dt>
            <dd><input type="file" name="pic" id="pic" /></dd>
        </dl>
      
            <dl>
        	<dt><label for="forbidden">电影状态默认为   <p><span style="color:red">未禁封</span></p></label></dt>
            <dd><input type="hidden" name="submit" value="修改状态" /></dd>
        </dl>
      
    </fieldset>
    <fieldset class="action">
    	<input type="submit" name="submit" id="submit" value="Submit" />
    </fieldset>
</form>
       </div>

</div>



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
    