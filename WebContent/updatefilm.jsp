<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
     <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/16sucai.css">
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
    <div class="text"><a href="padminfo.jsp">管理员信息</a></div>
  </div>
  <!-- 
  <div class="link1">
    <div class="text"><a href="filmadm.jsp">修改电影</a></div>
  </div>
   -->
  <div class="link1">
    <div class="text"><a href="upfilm.jsp">上架电影</a></div>
  </div>
   <div class="link1">
    <div class="text"><a href="downfilm.jsp">下架电影</a></div>
  </div>
 
  <div class="link1">
    <div class="text"><a href=".jsp">退出登录</a></div>
  </div>


</div>

</div>  
      
 <div class="main1">
    <div class="warpper">
    <div class="wwwqirecom">
    	<div class="qirepic">
            <ul class="info">
                <li>
                	<div class="qirepic-silder-panel">
                    	<a class="qirepic-silder-img" href="#"><img src="images/44.jpg" /></a>
                        <div class="qirepic-silder-intro">
                        	<div class="qirepic-silder-title">
                            	<h2><a target="_blank" href="#" title="雷神2 黑暗世界">雷神2 黑暗世界</a></h2>
                                <span>(DVD版)</span>
                            </div>
                            <ul class="qirepic-silder-info clearfix">
                            	<li class="long"><label>主演：</label><span>克里斯·海姆斯沃斯 汤姆·希德勒斯顿 娜塔丽·波特曼</span></li>
                                <li>类型：<span>冒险 魔幻</span></li>
                                <li>导演：<span>丹尼尔·米汗</span></li>
                                <li>年份：<span>2013</span></li>
                                <li>时间：<span>2013-12-04 00:21:38</span></li>
                            </ul>
                            <p class="qirepic-silder-desc">剧情：<span>在新的一集中，雷神还是要面对强大的黑暗的对手的挑战，他要不断地战斗，来保护九大国度和地球的安全。可是托尔所面对的对手过于强大，奥丁和阿斯卡德都无法招架。迫于要保全家国的想法，托尔只有一个人独自踏上了最危险也是最孤独的寻求解决之道的旅程。在影 ...</span></p>
                        </div>
                    </div>
                </li>
               </ul></div></div>
    
    </div>  

<form action="/film/updateFilm.do" method="post" class="niceform">
	<fieldset>
    	<legend>Film Info</legend>
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
            <dd><input type="text" name="intro" id=intro" size="32" maxlength="32" /></dd>
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
            	<select size="1" name="dobMonth" id="dobMonth">
                	<option value="1月">1月</option>
                    <option value="2月">2月</option>
                    <option value="3月">3月</option>
                    <option value="4月">4月</option>
                    <option value="5月">5月</option>
                    <option value="6月">6月</option>
                    <option value="7月">7月</option>
                    <option value="8月">8月</option>
                    <option value="9月">9月</option>
                    <option value="10月">10月</option>
                    <option value="11月">11月</option>
                    <option value="12月">12月</option>
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
                <select size="1" name="dobYear" id="dobYear">
                	<option value="2000">2000</option>
                    <option value="1999">1999</option>
                    <option value="1998">1998</option>
                    <option value="1997">1997</option>
                    <option value="1996">1996</option>
                    <option value="1995">1995</option>
					<option value="1994">1994</option>
					<option value="1993">1993</option>
					<option value="1992">1992</option>
					<option value="1991">1991</option>
					<option value="1990">1990</option>
					<option value="1989">1989</option>
					<option value="1988">1988</option>
					<option value="1987">1987</option>
					<option value="1986">1986</option>
					<option value="1985">1985</option>
					<option value="1984">1984</option>
					<option value="1983">1983</option>
					<option value="1982">1982</option>
					<option value="1981">1981</option>
					<option value="1980">1980</option>
					<option value="1979">1979</option>
					<option value="1978">1978</option>
					<option value="1977">1977</option>
					<option value="1976">1976</option>
					<option value="1975">1975</option>
					<option value="1974">1974</option>
					<option value="1973">1973</option>
					<option value="1972">1972</option>
					<option value="1971">1971</option>
					<option value="1970">1970</option>
					<option value="1969">1969</option>
					<option value="1968">1968</option>
					<option value="1967">1967</option>
					<option value="1966">1966</option>
					<option value="1965">1965</option>
					<option value="1964">1964</option>
					<option value="1963">1963</option>
					<option value="1962">1962</option>
					<option value="1961">1961</option>
					<option value="1960">1960</option>
					<option value="1959">1959</option>
					<option value="1958">1958</option>
					<option value="1957">1957</option>
					<option value="1956">1956</option>
					<option value="1955">1955</option>
					<option value="1954">1954</option>
					<option value="1953">1953</option>
					<option value="1952">1952</option>
					<option value="1951">1951</option>
					<option value="1950">1950</option>
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
        	<dt><label for="forbidden">电影状态默认为   <p>未禁封</p></label></dt>
            <dd><input type="submit" name="submit" value="修改状态" /></dd>
        </dl>
      
    </fieldset>
    <fieldset class="action">
    	<input type="submit" name="submit" id="submit" value="Submit" />
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
    