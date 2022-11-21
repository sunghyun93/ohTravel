$(document).ready(function(){
        //전체메뉴
        $("#menu1_wrap").hide();
        $("#main_navi ul li").eq(0).click(function(){
            $("#menu1_wrap").toggle();
        });
    
        //메인navi
        $(".hide1").hide();
        $("#menu_wrap").hide();  
        $("#main_navi ul li.sel").mouseover(function () {
            // $(".hide1", this).stop().slideDown();
            $(".hide1", this).css({"position":"absolute","left":"660px","top":"65px"});
            $(".hide1", this).show();
            $("#menu_wrap").show();
            $("#main_con5_wrap").css("z-index","0");
        }).mouseout(function () {
            // $(".hide1", this).stop().slideUp();
            $(".hide1", this).hide();
            $("#menu_wrap").hide();
            $("#main_con5_wrap").css("z-index","200");  
        });

        //id pwd 입력창
        $(".id_pwd input").mouseover(function(){
            $(this).css("outline","1px solid black");
        }).mouseout(function(){
            $(this).css("outline","");
        });

        //input 아래 a태그
        $(".a_menu a").mouseover(function(){
            $(this).css("text-decoration","underline");
        }).mouseout(function(){
            $(this).css("text-decoration","");
        });

        //전송버튼
        $("button[type='submit']").click(function(){
            if($("#id").val()==""||$("#id").val().length<3||$("#id").val().length>12){
               alert("아이디를 다시 입력해주세요")
               return false;
            }
            else if($("#pwd").val()==""||$("#pwd").val().length<3||$("#pwd").val().length>12){
                alert("비밀번호를 다시 입력해주세요")
                return false;
            }
            alert("로그인 성공");
        });
}); 