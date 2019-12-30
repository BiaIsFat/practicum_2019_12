<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="bean.*,java.util.*"%> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
/*if(session.getAttribute("uid")==null) {
    request.setAttribute("msg", "not login");
    response.sendRedirect(request.getContextPath()+"/film/index.do");
    return;
}*/
SessionBean sbean = (SessionBean)request.getAttribute("session");
List<SessionSeatBean> ss_list = (List)request.getAttribute("ss_list");
CinemaBean cinema = (CinemaBean)request.getAttribute("cinema");
FilmBean film = sbean.getFilm();
%>
<head>
<base href="<%=basePath%>"> <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" >
<link rel="stylesheet" type="text/css" href="css/16sucai.css">
<script src="js/jquery1.42.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>座位预定</title>

<jsp:include page="dir.jsp" flush="true"></jsp:include>

</head>
<style type="text/css">
body {
    margin: 0;
    padding: 0;
    line-height: 1.5em;
    font-family: Arial, Helvetica, sans-serif;
    font-size: 12px;
    color: #ffffff;
    background:#666666 ;
    height:100%;
}
 h1{margin:0 auto;margin-top:5%;margin-left:40%;color:#000;font-family: Arial, Helvetica, sans-serif;
    font-size: 18px;font-weight:800px;}
 h2{margin:0 auto;margin-top:2%;margin-left:45%;color:#CC3333;font-family: Arial, Helvetica, sans-serif;
    font-size: 10px;font-weight:300px;}

 .container{margin:0 auto;width:1150px;}
 .main{margin:0 auto;margin-top:5%;width:1150px;height:auto;background-color:#ffffff;}
  
  .part{margin:0 auto;background-color:#CC3333 ;width:1150px;height:50px;margin-top:-6%;}
  .part1{margin:0 auto;background-color:#fff ;width:1150px;height:50px;margin-top:-1%;}
  .footer{margin:0 auto;background-color:#000 ;width:1150px;height:150px;}

 
/*start booking*/
.pictures-logo img {
    display: block;
    top:5%;
    float:left;
    width: 60%;
    hight:60%;
    margin-left:5%;   		
}
#screen{
    display: block;
    width: 600px;
    color: red;
    font-weight: bold;
    background-color: #FFFFFF;
    border: 3px solid #af1313;
    text-align: center;
    margin: 20px auto 20px auto;
}
#seats{
    border: 1px solid green;
    width: 844px;
    margin: 0 auto;
    padding: 10px;
    background: white;
}
.seat {
    float: left;
    width: 50px;
    box-sizing: border-box;
    color: #676767;
    padding: 1px;
    height: 50px;
    background: #F4F4F4;
    border: 1px solid #979797;
    margin: 5px;
    border-bottom: 3px solid #F35E4F;
    cursor: pointer;
    display: flex;
}
.seatsRaw {
    display:inline-block;
    width:100%;
    
}
#booking_desc {
    width: 550px;
    /* border: 1px solid red; */
    background-color: #3C3636;
    color: #FAFAFA;
    margin: 30px auto;
    padding: 10px;
    display: table;
    }
.booking_left, .booking_right {
    width:250px;
    float:left;
    }
#total span {
    font-size: 16px;
    color: burlywood;
    }
#errMsg{
    color: #FF7777;
    }
/*end booking*/
</style>
<body>

<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>

	<script>

$(document).ready(function(){

                var seat_num ;
                var total_bill      = 0 ;
                var pricePerTicked  = <%=sbean.getPrice()%>;//单价
                var maximumSeats    =   5;//预定座位数目的最大限制

                $('#bookNowButton').hide(); // 隐藏预定按钮

                $('.seat').each(function() {       
                    var column_num = parseInt( $(this).index() ) + 1;
                    var row_num = parseInt( $(this).parent().index() )+1;    
                    seat_num = row_num+"-"+column_num;  
                    $(this).text(seat_num); // 座位号
                    $(this).addClass("seat"+seat_num);  // 个座位加css
                });

                $("#seats .false").click(function() {  
                        $('#errMsg').html('');
                        if($(this).hasClass('select')){ // 检查是否被选中
                            $(this).removeClass('select'); //如果选中了，移除选中的css
                            $(this).css('background-color','#D8D8D8'); // 重新加个背景

                            var currentSeatClass = $(this).attr('class').split(' ')[2]; 

                            console.log(currentSeatClass);
                             $( "#selected_seat ."+currentSeatClass ).remove();

                        }else if($(".your_selected_seat").length<maximumSeats && !$(this).hasClass('select')){ // 检查预定的座位数目是否超出限制
                            $(this).css('background-color','#71DCAA'); // 加背景颜色
                            $(this).addClass("select"); // 添加选中css
                            var ssno = $(this).attr("id");

                            var column_num = parseInt( $(this).index() ) + 1;
                            var row_num = parseInt( $(this).parent().index() )+1;    
                            $( "#selected_seat" ).append("<span class='your_selected_seat false seat"+row_num+"-"
                            		+column_num+" '> 座位号: <b style='color:#EAABFF'>"
                            		+"<input type='hidden' name='ssno' value='"+ssno+"'>"
                            		+ row_num+"排"+column_num +"座</b> </br></span>");
                        }else {
                            $('#errMsg').html('您选中的座位已经超过限制.');    
                        }

                        if($(".your_selected_seat").length){
                            $('#bookNowButton').fadeIn(1000);
                        }else {
                            $('#bookNowButton').fadeOut(1000);
                        }
                        //计算总价
                        total_bill = $(".your_selected_seat").length * pricePerTicked;
                        $('#total > span').html(total_bill);
                        $("#total-price").val(total_bill);
                });
                
                $("#seats .true").css("background-color","red");


    //}


});
</script>
 <!--BOOKING SECTION START-->
<div class="container">
    <div class="main">
 
    
    <div class="part"></div>
    
    
    <div class="warpper">
    <div class="wwwqirecom">
    	<div class="qirepic">
            <ul class="info">
                <li>
                	<div class="qirepic-silder-panel">
                    	<a class="qirepic-silder-img" href="#"><img src="image/<%=film.getFname() %>.png" /></a>
                        <div class="qirepic-silder-intro">
                        	<div class="qirepic-silder-title">
                            	<h2><a target="_blank" href="#" title="<%=film.getFname() %>"><%=film.getFname() %></a></h2>
                            </div>
                            <ul class="qirepic-silder-info clearfix">
                            	<li class="long"><label>主演：</label><span><%=film.getActor() %></span></li>
                                <li>类型：<span><%=film.getType() %></span></li>
                                <li>开场时间：<span><%=sbean.getBegin_time() %></span></li>
                                <li>影厅：<span><%=sbean.getRoom().getRname() %></span></li>
                                <li><%=cinema.getCname() %><span></span></li>
                            </ul>
                            <p class="qirepic-silder-desc">地址：<span><%=cinema.getAddr() %></span></p>
                        </div>
                    </div>
                </li>
               </ul></div></div>
    
    </div>  
   <div class="part1"> 
   <h1>STAER BOOKING NOW
   <i class="fa fa-hand-o-down" ></i></h1>
   <h2> WELCOME TO ISEE.COM</h2></div>   
      <div >
            <span id='screen'>
             <p>
               座位预定
            </p>
            </span>
            <div id="seats">
            <%
            int row = (int)Math.ceil(ss_list.size() / 6.0);
            
	        //for(SessionSeatBean ssbean : ss_list) { 
	            for(int i = 0; i < row; i++) {
	                %><div class="seatsRaw"><%
	                        for(int j=0; j < 6; j++) { 
	                           SessionSeatBean ssbean = ss_list.get(i*6+j);%>
	                           <div class="seat <%=ssbean.getStatus() %>" id="<%=ssbean.getSsno()%>"></div>
	                       <%} %>
	                </div>
	             <%}
            %>

            </div>
                    <form action="sessionseat/findOne.do?sno=<%=sbean.getSno()%>" method="post">
              <div id="booking_desc">
                <div class="booking_left">
                    <p style="color: #FBBC53;font-weight: bold; font-size: larger;">您选中的座位 </p>
                    <div id="selected_seat"></div>
                    <br>
                    <button id="bookNowButton" type="submit" >现在购票</button>
                    <div id="errMsg"></div>
                </div>

                <div class="booking_right">每个座位的单价: <%=sbean.getPrice()%> 元
                    <br><br>
                    <div id="total">总价：<span> 0 </span></div>
                    <input type="hidden" name="total" value="" id="total-price">
                </div>
             </div>
                    </form>

<div class="footer"></div>
        </div>
</div></div>
</body>
</html>

    