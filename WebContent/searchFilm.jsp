<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="bean.*,java.util.*"%>
    <%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>最近更新电影 - 搜索电影</title>
<meta name="keywords" content="最新电影,电影资料库"/>
<meta content="webkit" name="renderer" />
<meta name="applicable-device" content="pc">
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<base href="<%=basePath%>">
<link rel="stylesheet" href="css/1.css" />
<title>Insert title here</title>
</head>
<body>
<div>
<div id="header" class="wrapper header-wrapper">
<div id="header-bg" class="header-bg"></div>
    <div class="inner-wrapper">
            <div id="header-search" class="header-search">
            
                <form id="header-search-form" class="header-search-form" method="post" action="film/keySearch.do">
                    <div class="header-search-form-bg"></div>
                    <input id="header-search-keyword" class="header-search-keyword" name="keyword" type="text"/>
                    <input name="view" type="hidden" value="search"/>
                    <input class="header-search-submit" type="submit" value="搜索" />
                </form> 
            </div>

        </div>       
   <div class="align-right">
            <ul class="header-nav">
           <% if(session.getAttribute("uid")==null) { %>
             <a href="login.jsp">登录</a>
   <%} else { %>
             <a href="personal/findInfo.do" class="logged"><%=session.getAttribute("uname") %></a>
             <a href="personal/logout.do" class="logged">退出登录</a>
   <%} %>
   <a href="index.jsp"> 返回首页</a>
            </ul>   
        </div>
    </div>
</div>
<div class="container3">
<div class="wrapper">
    <div class="inner-wrapper">
        <div class="inner-2col-main">
        <div class="movie-filter">
            <dl>
                <dt>地区： </dt>
                <dd><a href="/movlist/____" class="current">全部</a><a href="/movlist/%E7%BE%8E%E5%9B%BD____">中国</a></dd>
            </dl>
            <dl>
                <dt>类型： </dt>
                <dd><a href="/movlist/____" class="current">全部</a><a href="/movlist/_%E5%96%9C%E5%89%A7___">喜剧</a> <a href="/movlist/_%E6%83%8A%E6%82%9A___">惊悚</a> <a href="/movlist/_%E5%8A%A8%E4%BD%9C___">动作</a></dd>
            </dl>
            <dl>
                <dt>上映： </dt>
                <dd><a href="/movlist/____" class="current">全部</a> <a href="/movlist/__2019-12__">本月</a><a href="/movlist/__2019__">2019</a> <a href="/movlist/__2018__">2018</a> <a href="/movlist/__2017__">2017</a> <a href="/movlist/__2016__">2016</a> <a href="/movlist/__2015__">2015</a> <a href="/movlist/__2014__">2014</a> </dd>
            </dl>
            <dl>
                <dt>排序： </dt>
                <dd><a href="/movlist/____" class="current">最近更新</a><a href="/movlist/___pubtime_">上映日期</a></dd>
            </dl>
        </div>
        <div class="movlist">
        <ul>
<%
            if(request.getAttribute("film_list") != null) {
                List<FilmBean> film_list = (List)request.getAttribute("film_list");
                int i=0;
                for(FilmBean film : film_list) {
        %>
			<li data-index="<%=i%>">
				<a href="film/find_one.do?fno=<%=film.getFno()%>" target="_blank">
					<img src="./image/<%=film.getPic()%>" alt="<%=film.getFname() %>" />
					<span class="item-title" title="<%=film.getFname() %>"><%=film.getFname() %></span>
					<span class="item-pubtime" title="评分">评分：<%=film.getGrades() %></span>
				</a>
			</li>                
  <%i++;}  }%>         
        </ul>
        </div>
        <p class="page-nav"><!-- 下一页暂时没解决 -->
            <a href="/movlist/____1" class="current">1</a><a href="/movlist/____2">2</a><a href="/movlist/____3">3</a><a href="/movlist/____4">4</a><a href="/movlist/____5">5</a><a href="/movlist/____6">6</a><a href="/movlist/____7">7</a>...<a href="/movlist/____402">402</a><a href="/movlist/____2">下一页</a>        </p>
    </div>
        <div class="inner-2col-side">
            <h3 class="list-title">
                电影分类
            </h3>
            <div class="textcloud">
                <ul>
                    <li><a href="/movlist/____">全部分类</a></li>
                    <li><a href="/movietype/%E5%96%9C%E5%89%A7">喜剧</a></li>
                    <li><a href="/movietype/%E6%83%8A%E6%82%9A">惊悚</a></li>
                    <li><a href="/movietype/%E5%8A%A8%E4%BD%9C">动作</a></li>
                </ul>
            </div>
            <h3 class="list-title">
                按年份筛选
            </h3>
            <div class="textcloud">
                <ul>
                    <li><a href="/movlist/__2019-12__">本月</a></li>
                    <li><a href="/movlist/__2019__">2019年</a></li>
                    <li><a href="/movlist/__2018__">2018年</a></li>
                    <li><a href="/movlist/__2017__">2017年</a></li>
                    <li><a href="/movlist/__2016__">2016年</a></li>
                    <li><a href="/movlist/__2015__">2015年</a></li>
                    <li><a href="/movlist/__2014__">2014年</a></li>
                    <li><a href="/movlist/__2013__">2013年</a></li>
                </ul>
            </div>
            <div class="side-box">
            </div>
            <div class="side-box">
            <h3 class="list-title">
                <a href="/topmovie/today" target="_blank" title="24小时排行榜">24小时排行榜</a>
            </h3>
            <ul class="itemlist side-smallposter">
<ul class="side-smallposter"><li><a href="/movie/29139" title="半个喜剧" target="_blank"><img src="image/1.png" alt="半个喜剧" /><span class="item-title" title="半个喜剧">半个喜剧</span></a></li><li><a href="/movie/27920" title="紧急救援" target="_blank"><img src="image/2.png" alt="紧急救援" /><span class="item-title" title="紧急救援">紧急救援</span></a></li><li class="last"><a href="/movie/15447" title="姜子牙" target="_blank"><img src="image/1.png" alt="姜子牙" /><span class="item-title" title="姜子牙">姜子牙</span></a></li></ul><table class="tlist"><tr><td>2020-01-25</td><td><a href="/movie/27611" title="囧妈" target="_blank">囧妈</a></td></tr><tr><td>2020-01-25</td><td><a href="/movie/28394" title="急先锋" target="_blank">急先锋</a></td></tr><tr><td>2020-01-25</td><td><a href="/movie/29112" title="熊出没·狂野大陆" target="_blank">熊出没·狂野大陆</a></td></tr><tr><td>2019-12-31</td><td><a href="/movie/28077" title="宠爱" target="_blank">宠爱</a></td></tr><tr><td>2019-12-27</td><td><a href="/movie/29141" title="特警队" target="_blank">特警队</a></td></tr><tr><td>2020-01-25</td><td><a href="/movie/26006" title="唐人街探案3" target="_blank">唐人街探案3</a></td></tr></table>                </ul>

        </div>            
    </div>
</div>
<div id="movtip" class="movtip" style="display: none;"></div>

<div class="wrapper footer-wrapper">
    <div class="inner-wrapper">
  
        <div class="align-right">

        </div>
    </div>
</div>
</div></div>
</body>
</html>