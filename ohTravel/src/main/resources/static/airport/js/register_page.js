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

    //전체선택 체크박스
    $("#chkAll").change(function(){
        var result = $("#chkAll").prop("checked");
        if(result) {
            $(".checkBtn input[type='checkbox']").prop("checked",true);
        }
        else{
            $(".checkBtn input[type='checkbox']").prop("checked",false);
        }
    });


    //전송버튼
    $("button[type='submit']").click(function(){
        for(var i =0 ; i<3;i++){
            if(!$(".checkBtn input[type='checkbox']").eq(i).prop("checked")){
                console.log($(".checkBtn input[type='checkbox']").eq(i));
                alert("필수입력 사항을 확인해주세요");
                return false;
            }
        }
    });
}); 