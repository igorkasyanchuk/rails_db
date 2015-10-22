//= require jquery
//= require jquery_ujs
//= require foundation
//= require rails_db/sticky
//= require rails_db/jquery.cookie
//= require codemirror
//= require codemirror/modes/sql

$(function(){
  $(document).foundation();

  jQuery.expr[":"].icontains = jQuery.expr.createPseudo(function (arg) {
    return function (elem) {
        return jQuery(elem).text().toUpperCase().indexOf(arg.toUpperCase()) >= 0;
    };
  });

  $('.per_page_pagination_select').on('change', function() {
    $(this).parents('form').submit();
  });

  $('#rails_db_tables_input').on('keyup', function() {
    value = $(this).val();
    $("#rails_db_tables a").show();
    $("#rails_db_tables a:not(:icontains('" + value + "'))").hide();
  });

  $('.expand, .collapse').on('click', function() {
    $('#main_content').toggleClass('push-3')
    $('#main_content').toggleClass('large-9')
    $('#main_content').toggleClass('large-12')
    $('#sidebar').toggle();
    $('.collapse').toggle();
    $('.expand').toggle();
    $.removeCookie('sidebar_visible');
    $.cookie('sidebar_visible', $('.expand').is(':visible'), { expires: 30, path: '/' });
    return false;
  });

});