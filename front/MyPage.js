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

        console.log(num);

    });
    

});