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

  $('body').on('change', '.per_page_pagination_select', function() {
    $(this).parents('form').submit();
  });

  $('body').on('keyup', '#rails_db_tables_input', function() {
    value = $(this).val();
    $("#rails_db_tables a").show();
    $("#rails_db_tables a:not(:icontains('" + value + "'))").hide();
  });

  $('body').on('click', '.expand, .collapse', function() {
    expand_collapse();
    save_expand_collapse();
    return false;
  });



  console.log('Sidebar: ' + $.cookie('sidebar_visible'));
});

function expand_collapse() {
  $('#main_content').toggleClass('push-3')
  $('#main_content').toggleClass('large-9')
  $('#main_content').toggleClass('large-12')
  $('#sidebar').toggle();
  $('.collapse').toggle();
  $('.expand').toggle();
};

function save_expand_collapse() {
  $.removeCookie('sidebar_visible');
  $.cookie('sidebar_visible', $('.expand').is(':visible'), { expires: 30, path: '/' });
};

function init_sql_editor() {
  var editor = CodeMirror.fromTextArea($('#sql').get(0), {
      "theme": 'pastel-on-dark',
      "lineNumbers": true,
      "mode": "text/x-sql",
      "tabSize": 4,
      height: 'auto',
      extraKeys: {
        'Ctrl-Enter': function() {
          $(editor.getInputField()).parents('form').submit();
        }
      }
    });
  editor.setSize('100%', '300');
  editor.focus();
}