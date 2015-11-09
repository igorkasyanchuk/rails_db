//= require jquery
//= require jquery_ujs
//= require rails_db/foundation.min
//= require_tree ../rails_db/foundation/
//= require rails_db/sticky
//= require rails_db/jquery.cookie
//= require codemirror
//= require codemirror/modes/sql
//= require codemirror/addons/hint/show-hint.js
//= require codemirror/addons/hint/sql-hint.js

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

  $('body').on('click', '.settings-link', function() {
    $('.rails-db-settings').toggle();
  });

  $('body').on('click', '.column-selection input, .column-name', function() {
    table_name = $('h2')[0].innerHTML;
    if($(this).hasClass('column-name')){
      column_name = $(this)[0].innerHTML.replace(/\s+/, '').replace(/\s+/, '');
      if($(this).prev().prop('checked') == false){
        $(this).prev().prop('checked', true)
        remove_column_from_cookie(table_name, column_name);
      } else {
        $(this).prev().prop('checked', false)
        write_column_to_cookie(table_name, column_name);
      }
    } else {
      column_name = $(this).prop('name');
      if($(this).prop('checked') == false){
        write_column_to_cookie(table_name, column_name);
      } else {
        remove_column_from_cookie(table_name, column_name);
      }
    }
    $('th.column_' + column_name).toggle();
    $('td.column_' + column_name).toggle();
  });

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

function write_column_to_cookie(table_name, column_name) {
  column_names = get_column_names_from_cookie(table_name);
  $.cookie(table_name, column_names += ', ' + column_name);
};

function remove_column_from_cookie(table_name, column_name) {
  column_names = get_column_names_from_cookie(table_name);
  $.cookie(table_name, column_names.replace(', ' + column_name, ''));
};

function get_column_names_from_cookie(table_name) {
  if($.cookie(table_name) == undefined) {
    return '';
  } else {
    return $.cookie(table_name);
  }
};

// https://github.com/codemirror/CodeMirror/blob/master/mode/sql/index.html
function init_sql_editor(mime, tables) {
  var editor = CodeMirror.fromTextArea($('#sql').get(0), {
      mime: mime,
      hint: CodeMirror.hint.sql,
      matchBrackets: true,
      smartIndent: true,
      autofocus: true,
      "theme": 'pastel-on-dark',
      "lineNumbers": true,
      "mode": "text/x-sql",
      "tabSize": 4,
      height: 'auto',
      extraKeys: {
        "Esc": 'autocomplete',
        "Ctrl": 'autocomplete',
        "Ctrl-Space": 'autocomplete',
        "Ctrl-Enter": function() {
          $(editor.getInputField()).parents('form').submit();
        }
      },
      hintOptions: {
        tables: tables
      }
    });
  editor.setSize('100%', '300');
  editor.focus();
};
