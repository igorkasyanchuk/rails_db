//= require jquery
//= require jquery_ujs
//= require foundation
//= require rails_db/sticky
//= require codemirror
//= require codemirror/modes/sql

$(function(){
  $(document).foundation();

  $('.per_page_pagination_select').on('change', function() {
    $(this).parents('form').submit();
  });

  $('#rails_db_tables_input').on('keyup', function() {
    value = $(this).val();
    $("#rails_db_tables a").show();
    $("#rails_db_tables a:not(:contains('" + value + "'))").hide();
  });
});