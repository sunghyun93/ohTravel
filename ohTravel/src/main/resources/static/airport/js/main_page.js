$(document).ready(function () {
    


    //전체메뉴
    $("#menu1_wrap").hide();
    $("#main_navi ul li").eq(0).click(function(){
        $("#menu1_wrap").toggle();
    });

    //메인navi
    $(".hide1").hide();
    $("#menu_wrap").hide();  
    $("#main_navi ul li+li.sel").mouseover(function () {
        // $(".hide1", this).stop().slideDown();
        $(".hide1", this).css({"position":"absolute","left":"660px","top":"65px"});
        $(".hide1", this).show();
        $("#menu_wrap").show();
    }).mouseout(function () {
        // $(".hide1", this).stop().slideUp();
        $(".hide1", this).hide();
        $("#menu_wrap").hide();  
    });
    
    //미니이미지4개
    $("#travle_mini a").mouseover(function(){
        $(this).css("transition","all 0.5s").css("transform:","scale(1.5)");
    });

    //세계여행지도
    $(".map_contents").mouseenter(function () {
        $(".map_contents").not(this).css("z-index","-500");
        $(".arrow",this).stop().hide(0);
        $("p",this).eq(0).stop().hide(0);
        $("span",this).stop().hide(0);
        $("p",this).eq(1).css({"position":"absolute","right":"20px","bottom":"20px"});
        $(".arrow",this).css("background-color","#ff4040");
        $(".arrow",this).finish().fadeIn(800);
        $("p",this).eq(0).css({"position":"absolute","left":"20px","bottom":"50px","color":"white"});
        $("p",this).eq(0).finish().fadeIn(700);
        $("span",this).css({"position":"absolute","left":"20px","bottom":"20px","color":"white"});
        $("span strong",this).css("color","#ffffff");
        $("span",this).finish().fadeIn(500);
        $(this).css("height","200px");
        $(this).finish().animate({
            'width':'180px'
        });
        $(this).css("width","180px;").css("height","200px");
        $(this).find("img").stop().animate({
            left: "0"
        }, 800, "easeOutQuint");    
    }).mouseleave(function () {
        $(".map_contents").not(this).css("z-index","");
        $("p",this).eq(0).finish().css({"position":"","left":"","bottom":"","color":""});
        $("span",this).finish().css({"position":"","left":"","bottom":"","color":""});
        $("span strong",this).css("color","");
        $("p",this).eq(1).finish().css({"position":"","right":"","bottom":""});
        $(".arrow").finish().css("background-color","");
        $(this).finish().animate({
            'width':'180px',
            'height':'130px'
        });
        $(this).find("img").finish().animate({
            left: "-180px"
        }, 50);
    });


    //우측탑메뉴
    $(window).scroll(function(){
        if($(this).scrollTop()>700){
            $("#btn_top").fadeIn(500);
        }
        else {
            $("#btn_top").fadeOut(300);
        }
        $("#btn_top").click(function(){
            $('html,body').stop().animate({scrollTop:0},300);
        });
    });

});

$(window).on('load', function() {
        //메인이미지
        var slide = $(".bxslider").bxSlider({
            auto:true,mode:'horizontal',
        });
});
