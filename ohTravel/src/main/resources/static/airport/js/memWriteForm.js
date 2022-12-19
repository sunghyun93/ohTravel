// 화살표 클릭 이벤트, fold-box / fold-box expanded 변환
$(function() {
    $('.arrowImg1').click(function() {
        let foldbox = $('.fold-box-list').children().eq(0); // li.fold-box
        
        if($('.arrowImg1').attr('src') == '/airport/img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg1').attr('src', '/airport/img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg1').attr('src', '/airport/img/arrow_up.svg');
        }
    });

    $('.arrowImg2').click(function() {
        let foldbox = $('.fold-box-list').children().eq(1); // li.fold-box
        
        if($('.arrowImg2').attr('src') == '/airport/img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg2').attr('src', '/airport/img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg2').attr('src', '/airport/img/arrow_up.svg');
        }
    });

    $('.arrowImg3').click(function() {
        let foldbox = $('.fold-box-list').children().eq(2); // li.fold-box
        
        if($('.arrowImg3').attr('src') == '/airport/img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg3').attr('src', '/airport/img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg3').attr('src', '/airport/img/arrow_up.svg');
        }
    });
    
     $('.arrowImg4').click(function() {
        let foldbox = $('.fold-box-list').children().eq(3); // li.fold-box
        
        if($('.arrowImg4').attr('src') == '/airport/img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg4').attr('src', '/airport/img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg4').attr('src', '/airport/img/arrow_up.svg');
        }
    });
    
     $('.arrowImg5').click(function() {
        let foldbox = $('.fold-box-list').children().eq(4); // li.fold-box
        
        if($('.arrowImg5').attr('src') == '/airport/img/arrow_up.svg') {
            foldbox.attr('class', 'fold-box expanded');
            $('.arrowImg5').attr('src', '/airport/img/arrow_down.svg');
        } else {
            foldbox.attr('class', 'fold-box');
            $('.arrowImg5').attr('src', '/airport/img/arrow_up.svg');
        }
    });
    
    
});

// 전체 약관 / 개별 약관
$(function() {
    // 전체 약관을 눌렀을 때 모두 선택 / 모두 취소
    $('#foldCheckAll').on('click', function() {
        let checked = $(this).is(":checked");
        
        if(checked) {
            $('.foldTermCheck').prop('checked', true);
        } else {
            $('.foldTermCheck').prop('checked', false);
        }
        
    });

    // 전체선택 후 하나만 해제했을 때, 전체 선택도 해체해주기
    $($('.foldTermCheck')).on('click', function() {
        let is_checked = true;
        
        $('.foldTermCheck').each(function() {
            is_checked = is_checked && $(this).is(":checked");
        });

        $('#foldCheckAll').prop('checked', is_checked);
    });
});

//전체약관 클릭안하면 다음단계로 안넘어가게

$(function(){
	 $('.next_stepBtn').on('click', function() {

		if($('#foldCheckAll').prop("checked") == false){
		  alert('전체약관에 동의해주세요');
		  return false;
		}
	});
});
	




