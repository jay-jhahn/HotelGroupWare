<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../setting.jsp"%>
<body>
<script type="text/javascript">
$(function(){
	   var submenu = $(this).next("ul");
	    var submenu = $(this).next("ul");
	     $('.dpMenu').mouseenter(function(){
	         this.classList.add('active');
	         submenu.slideDown();
	     });
	     $('.dpMenu').mouseleave(function(){
	        this.classList.remove('active');
	     });
	     
	});
	   
	$(document).ready(function(){
	   $(".dpMenu>a").click(function(){
	        var submenu = $(this).next("ul");
	        // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	        if(submenu.is(":visible") ){
	            submenu.slideUp();
	        } else {
	           submenu.slideDown();
	        }
	    });
	});   
</script>
<div class="sidebar" data-color="sora" >
  <div class="logo">
      <a href="#" class="simple-text logo-mini">
		HMS
      </a>

      <a href="#" class="simple-text logo-normal">
		공통
      </a>
      
  </div>

  <div class="sidebar-wrapper" id="sidebar-wrapper">
      <ul class="nav">
            <li class="dpMenu">
                <a>
               		<i class="now-ui-icons design_app"></i> 공지사항
                </a>
                <ul class="hide list-group list-group-flush text-center" style="display: none;">
					<li class="subMenuLi list-group-item" onclick="boardList();"><a>게시글목록</a></li>
					<li class="subMenuLi list-group-item" onclick="boardWrite();"><a>게시글쓰기</a></li>
				</ul>
            </li>
           
           <li class="dpMenu" >
             <a href="#">
	             <i class="now-ui-icons design_app"></i>
	             <p> 스케줄 관리 </p>
             </a>
             <ul class="hide list-group list-group-flush text-center" style="display: none;">
                <li class="list-group-item scheduleList"><a href="reqDayOff.al"> 휴가신청 </a></li>
                <li class="list-group-item scheduleList"><a href="monthSchedule.al"> 스케줄 근무 조회 </a></li>
                <%-- 객실팀 매니저, 시니어매니저만 보이는 메뉴 --%>
                <sec:authorize access="hasAnyRole('ROLE_ROM', 'ROLE_ROSM')">
                	<li class="list-group-item scheduleList"><a href="insertSchedule.al"> 스케줄 입력 </a></li>
                </sec:authorize>
             </ul>
          </li>
            
            <li >
                <a href="#">
                	<i class="now-ui-icons location_map-big"></i> 업무일지 관리
                </a>
            </li>
            
             <li class="dpMenu">
                <a>
               		<i class="now-ui-icons ui-1_bell-53"></i> 직원복지
                </a>
                <ul class="hide list-group list-group-flush text-center" style="display: none;">
					 <li class="list-group-item scheduleList"><a href="welfareCard.al"> 직원 할인 패키지 </a></li>
					 <li class="list-group-item scheduleList"><a href="welfareMyCupon.al"> 마이 쿠폰 목록 </a></li>
				</ul>
            </li>
      </ul>
  </div>
</div>

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

</body>
</html>