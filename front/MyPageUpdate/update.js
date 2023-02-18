$(document).ready(function() {
    // 텝 메뉴 js 파일
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
    
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
    
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    })

    let num = 1;
    $('#btn_add').click(function() {

        $('#tab_title' + (num++)).css('display', 'inline-block');

        if(num > 6) {
            num = 5;
            alert('마지막 페이지입니다.')
        }

    });
    
    $('#btn_del').on('click', function() {
        
        $('#tab_title' + (num)).css('display', 'none');

        num--;

        if(num < 0) {
            alert('더 이상 제거 할 수 없습니다.')
            num = 1;
        }
    });
    

});