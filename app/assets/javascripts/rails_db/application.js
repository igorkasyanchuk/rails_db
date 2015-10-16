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
  })
});