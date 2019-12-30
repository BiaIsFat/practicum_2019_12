<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="bean.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
    CinemaBean cinema = (CinemaBean)request.getAttribute("cinema");
%>
<base href="<%=basePath%>">
<meta charset="utf-8" />
<title><%=cinema.getCname() %></title>
<jsp:include page="dir.jsp" flush="true"></jsp:include>
<meta content="webkit" name="renderer" />
<meta name="applicable-device" content="pc">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<link rel="stylesheet" href="css/4.css" />
</head>


<body >
<div class="container">


<div id="nav-wrapper" class="wrapper nav-wrapper">
    <div class="inner-wrapper">

    </div>
</div>

<div id="title-wrapper" class="wrapper movie-title-wrapper">
    <div class="inner-wrapper">
        <div class="movie-title-mpic">            <a href="/" title="半个喜剧电影海报"><img src="image/1.png" alt="半个喜剧电影海报"/></a>
            
        </div>
        <h1 class="movie-name" title="<%=cinema.getCname() %>"><%=cinema.getCname() %></h1>
        <div class="movie-title-detail">
            <p>
            <span class="detail-title">地址：</span><%=cinema.getAddr() %><br/>
            
            <span class="detail-title">电话：</span><%=cinema.getTel() %><br/>
            <span class="detail-title">营业时间：</span><%=cinema.getWorktime() %>
 <br/>
            </p>       
        <div class="movie-quickplay"> 
        <a href="javascript:history.back(-1)" class="btn-big btn-green">返回</a> 
        </div>
        </div>
    <div class="movie-sideinfo">

    </div>
    </div>    
</div>

<a name="content-anchor" id="content-anchor" href="#"></a>

<div class="wrapper">
    <div class="inner-wrapper">
    <div class="inner-2col-main">


            <div id="fromurlfilter-maoyan" class="fromurlfilter"> 
            <h3 class="list-title">
                 选择场次
            </h3>

          <table class="tlist">
        
            <tr>
              <th class="tlist-addtime">场次</th>
            
              <th class="tlist-trailertitle">电影名称</th>
                <th class="tlist-addtime">开场时间</th>
                <th class="tlist-addtime">散场时间</th>
              <th class="tlist-addtime">票价</th>
              <th class="tlist-fromsite"></th>
            </tr>
            <%
              if(request.getAttribute("session_list") != null) {
                 List<SessionBean> session_list = (List)request.getAttribute("session_list");
                 int i=0;
                 for(SessionBean sbean : session_list) {
                     i++;
                 %>
      <tr>
	      <td><span><%=i %></span></td>
	      <td>
	        <a href="/" class="tlist-title" target="_blank"><%=sbean.getFilm().getFname() %></a>
	      </td>
	      <td>
	        <a href="/" class="tlist-title" target="_blank"><%=sbean.getBegin_time() %></a> 
	      </td> 
	           <td>
	        <a href="/" class="tlist-title" target="_blank"><%=sbean.getEnd_time() %></a> 
	      </td>   
	      <td>
	        <a href="/" class="tlist-title" target="_blank"><%=sbean.getPrice() %></a>
	      </td>
	      <td>
	          <a id="dlbtn130525" href="sessionseat/findSeats.do?sno=<%=sbean.getSno() %>" style="background-color:#7cd37c;color:#000" target="_blank" title="">选座</a>
          </td>
    </tr> 
                 <%
                 }   
              }
            %>
                   </table>
        </div>
        </div>    












    </div>
</div>
    <div id="movie-preview-bg" class="movie-preview-bg"></div>
<div id="movie-preview-wrapper" class="movie-preview-wrapper">
    <div id="movie-preview-close" class="movie-preview-close">关闭</div>
    <div id="movie-preview-player" class="movie-preview-player"></div>
</div>
</div>
</body></html>

