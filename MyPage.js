$(document).ready(function() {
    // 텝 메뉴 js 파일
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');
    
        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');
    
        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
    })

    $('#btn_add').click(function() {
        let num = 1;
        
        
        $().after();    
        
    


    });
    
    





});