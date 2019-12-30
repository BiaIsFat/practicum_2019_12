<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,bean.*"%> 
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
if(session.getAttribute("first_index")==null) {
    response.sendRedirect(request.getContextPath()+"/film/index.do");
    return;
} else {
    session.removeAttribute("first_index");
}
List<FilmBean> film_list = (List)request.getAttribute("film_list");
List<CinemaBean> cinema_list = (List)request.getAttribute("cinema_list");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="css/showfilm.css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
 <link rel="stylesheet" href="css/index.css">
 
 <link rel="stylesheet" type="text/css" href="css/showf.css">
<script src="js/jquery1.42.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<jsp:include page="dir.jsp" flush="true"></jsp:include>

</head>

<body>
<div class="container">
   <!--头部  -->
 
   <!--导航  -->
       <div id="lunbotu">
            <div id="banner">
                <img class="m" src="image/banner.jpg" />
                <img class="m" src="image/banner1.jpg" />
                <img class="m" src="image/banner2.jpg" />
            
            </div>
            <div id="biao">
                <ul>
                    <li id="biao_1">1</li>
                    <li id="biao_1">2</li>
                    <li id="biao_1">3</li>
                 
                </ul>
            </div>
        </div>
  
    
    <%
    // Sort by occupancy
Collections.sort(film_list, new Comparator<FilmBean>(){
    @Override
    public int compare(FilmBean f1, FilmBean f2) {
       double diff = f1.getOccupancy() - f2.getOccupancy();
       if(diff<0){
           return 1;
       } else if(diff>0){
           return -1;
       }else{
           return 0;
       }
    }
}); %>
   <!-- 主体部分 -->
       <div class="main">
       <div class="main1"><h1 class="m_2">上座率排行   <i class="fa fa-list-ol"></i></h1>
       <table class="t">
       <%
       int i=0;
       for(FilmBean film : film_list) {
    	   if(++i == 6) {break;}
    	   %>
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o" ></i>    <%=film.getFname() %></h1></td><td class="t2"><h1 class="m_3"><%=film.getOccupancy() %></h1></td></tr>
       <%} %>
       <!--  
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o" ></i>    误杀</h1></td><td class="t2"><h1 class="m_3">980</h1></td></tr>
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o"></i>    星球大战：天行者崛起</h1></td><td class="t2"><h1 class="m_3">899</h1></td></tr>
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o" ></i>    半个喜剧 </h1></td><td class="t2"><h1 class="m_3">699</h1></td></tr>
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o" ></i>    只有云知道 </h1></td><td class="t2"><h1 class="m_3">400</h1></td></tr>
       -->
      </table> 
          <%
    // Sort by box-office
Collections.sort(film_list, new Comparator<FilmBean>(){
    @Override
    public int compare(FilmBean f1, FilmBean f2) {
       double diff = f1.getBoxoffice() - f2.getBoxoffice();
       if(diff<0){
           return 1;
       } else if(diff>0){
           return -1;
       }else{
           return 0;
       }
    }
}); %>
       </div>
        <div class="main2"><h1 class="m_2">票房排行   <i class="fa fa-list-ol" ></i></h1>
        <table class="t_1">
        <% i=0; 
        for(FilmBean film : film_list) {
        	if(++i==6) {break;}%>
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o" ></i> <%=film.getFname() %>  </h1></td><td class="t2"><h1 class="m_3"><%=film.getBoxoffice() %></h1></td></tr>
       <%} %>
 
      </table>
          <%
    // Sort by grades
Collections.sort(film_list, new Comparator<FilmBean>(){
    @Override
    public int compare(FilmBean f1, FilmBean f2) {
       double diff = f1.getGrades() - f2.getGrades();
       if(diff<0){
           return 1;
       } else if(diff>0){
           return -1;
       }else{
           return 0;
       }
    }
}); %>          
        </div>
        <div class="main3"><h1 class="m_2">评分排行   <i class="fa fa-list-ol" ></i></h1>
           <table class="t_2">
           <%i=0;
           for(FilmBean film : film_list) { 
           		if(++i==6){break;}%>
       <tr><td ><h1 class="m_1"><i class="fa fa-heart-o" ></i>   <%=film.getFname() %> </h1></td><td class="t2"><h1 class="m_3"><%=film.getGrades() %></h1></td></tr>
       <%} %>
     
      </table>
        
        
        </div>
   </div>
   
   
    <div class="part1">
    <div class="part1_2"><h1 class="b_1">最近热映   <i class="fa fa-video-camera" ></i></h1></div>
     <div class="part1_1"> 
     <div class="hengtu">
     <%int j=0; 
     for(FilmBean film : film_list) { 
     j++;
     if(j==6) break;%>
       <img class="film-pic" src="image/<%=film.getPic() %>">
       <%} %>
   
     </div>
     </div>
</div>
   
      <div class="part2"> <div class="part1_2"><h1 class="b_1">即将上映 <i class="fa fa-calendar-plus-o" ></i></h1>
     <div class="part2_1"><h1>欢迎来到评论区讨论</h1></div>
     <div class="part2_2">
          <div class="jj" >
       <%i=0; 
     for(FilmBean film : film_list) { 
     i++;
     if(i==6) break;%>   
    <img class="film-pic" src="image/<%=film.getPic() %>">
     <%} %>
       <!--  
        <img src="image/3.jpg">
      <img src="image/s.jpg">
      <img src="image/s.jpg">
      -->
     </div></div>
     </div></div>

      <div class="part3"> <div class="part1_2"><h1 class="b_1">我的片库 <i class="fa fa-film" ></i></h1>
     <div class="part3_1">
     <table class="tt">
     <tr><td colspan="4"><h1 class="m_2">片库分类</h1></td></tr>
     <tr><td ><h2>剧情</h2></td><td><h2>喜剧</h2></td><td><h2>爱情</h2></td><td><h2>传记</h2></td></tr>
     </table>
     
     
     </div>
     <div class="part3_2">
        <table class="t_2">
       <tr><td ><h1 class="m_2"> 热门影院选择 </h1></td><td><i class="fa fa-telegram" ></i>  </td></tr>
        <%for(CinemaBean cinema : cinema_list) { %>
       <tr><td ><h1 class="m_1"><%=cinema.getCname() %></h1></td><td><h1 class="m_1"><%=cinema.getTel() %></h1></td></tr>
       <%}%>
<!-- 
       <tr><td ><h1 class="m_1">集美万达影城</h1></td><td class="t2"><h1 class="m_1">XXXXXX</h1></td></tr>
       <tr><td ><h1 class="m_1">新华都完美世界影城 </h1></td><td ><h1 class="m_1">XXXXX</h1></td></tr>
       <tr><td ><h1 class="m_1">杏林湾影城</h1></td><td><h1 class="m_1">XXXXXXX</h1></td></tr>     
        -->
      </table>
        
     </div>

     </div>
     </div>
    
  <div class="part4">
    <div class="part1_21"><h1 class="b_1">热门预告片   <i class="fa fa-video-camera" ></i></h1></div>
     <div class="part4_1"> 


    <% for(FilmBean film_:film_list){%>
<div class="warpper">
    <div class="wwwqirecom">
    	<div class="qirepic">
            <ul class="info">
                <li>
                	<div class="qirepic-silder-panel">
                    	<a class="qirepic-silder-img" href="#"><img src="image/冰雪奇缘.png" /></a>
                        <div class="qirepic-silder-intro">
                        	<div class="qirepic-silder-title">
                            	<h2><a target="_blank" href="#" title="<%=film_.getFname() %>"><%=film_.getFname() %></a></h2>
                                <span><%=film_.getView() %></span>
                            </div>
                            <ul class="qirepic-silder-info clearfix">
                            	<li class="long"><label>主演：</label><span><%=film_.getActor() %></span></li>
                                <li>类型：<span><%=film_.getType() %></span></li>
                                <li>时长：<span><%=film_.getDuration() %></span></li>
                                <li>上映时间：<span><%=film_.getOntime() %></span></li>
                                <li>发行国家：<span><%=film_.getCountry() %></span></li>
                            </ul>
                            <p class="qirepic-silder-desc">剧情：<span><%=film_.getIntro() %></span></p>   
                            <a class="qirepic-silder-play" href="" target="_blank">立即观看</a>
                        </div> 
                    </div>
      
                </li>
            </ul>
        </div>
        <div class="num">
            <ul>
                <li><a href="" target="_blank"><img src="image/冰雪奇缘.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/宠爱.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/囧妈.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/特警队.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/妙先生.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/那人那事.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/惊涛迷局.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/创客兄弟.png" /></a></li>
                <li><a href="" target="_blank"><img src="image/尼斯大冒险.png" /></a></li>
            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
$(".wwwqirecom").slide({ titCell:".num ul li" , mainCell:".qirepic ul.info" , effect:"fold",
	autoPlay:true , delayTime:300 }); <%} %>
</script>
    </div>
     </div>
      <!-- 底部 -->

  <div class="zhanlan"><h1>WELCOME TO ISEE.COM</h1>
  
     </div>
   <div class="footer"><h2>我要看——在线票务平台  选座购票流程 取票流程 产检问题</h2>
   <span><h2>© 2019 ISEE.com 版权所有</h2></span> 
 
    </div></div>
  
</body>
   <script type="text/javascript">
        var slid = document.getElementById("banner");
        //var id = document.getElementById("bt");
        var imgwidth = document.getElementsByClassName("m");
        var oli=document.getElementsByTagName("li");
        //console.log(oli);
        //console.log(imgwidth );
        var i =0;
        auto();
        oli[0].style.cssText="background:#CC3333; color:#fff;";
        function auto(){

            time = setInterval(function(){
                i++;
            if(i <= 2) {
                slid.style.left = slid.offsetLeft - 1226 + "px";
                oli[i].style.cssText="background:#CC3333;color:#fff;";
                oli[i-1].style.cssText="background:none;color:#000;";
            } else {
                slid.style.left ="0px";
                oli[4].style.cssText="background:none;color:#000;";
                oli[0].style.cssText="background:#CC3333;color:#fff;";
                i=0;
            }
            console.log(i);

        }, 3000)

        }

            for(var j=0;j<=2;j++){
                //console.log(imgwidth[j].index);
            imgwidth[j].index=j;
            oli[j].index=j;
            oli[j].onmouseover=function(){
                this.style.cssText="background:#CC3333;color:#fff;"    
                this.onmouseout=function(){
                    this.style.cssText="background:none;color:#000;"
                }
            }

            oli[j].onclick=function(){
                clearInterval(time);
                m=this.index;
                slid.style.left=-m*1226+"px";    
                i=m;
                auto();
                console.log(i);
            }
            }    
    </script>



</html>
    