'use strict';

//각 id에 해당하는 섹션으로 스크롤
//섹션에 포커스가 이동되었음을 구현하려 하였으나 보류
function scrollUnderHeader(id){
    // $('.secTitle').tabIndex = "-1";
    $(id+' .secTitle').tabIndex = "0";
    $(id+' .secTitle').focus();
    const headerHeight = $('header').outerHeight();
    window.scrollTo(0,$(id).offset().top - headerHeight);
}


