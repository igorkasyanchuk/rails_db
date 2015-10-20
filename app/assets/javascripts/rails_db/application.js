//= require jquery
//= require jquery_ujs
//= require foundation
//= require rails_db/sticky
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
});