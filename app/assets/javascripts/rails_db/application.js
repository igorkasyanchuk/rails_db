//= require jquery
//= require jquery_ujs
//= require rails_db/foundation.min
//= require rails_db/foundation/foundation.abide
//= require rails_db/foundation/foundation.accordion
//= require rails_db/foundation/foundation.alert
//= require rails_db/foundation/foundation.clearing
//= require rails_db/foundation/foundation.dropdown
//= require rails_db/foundation/foundation.equalizer
//= require rails_db/foundation/foundation.interchange
//= require rails_db/foundation/foundation.joyride
//= require rails_db/foundation/foundation.magellan
//= require rails_db/foundation/foundation.offcanvas
//= require rails_db/foundation/foundation.orbit
//= require rails_db/foundation/foundation.reveal
//= require rails_db/foundation/foundation.slider
//= require rails_db/foundation/foundation.tab
//= require rails_db/foundation/foundation.tooltip
//= require rails_db/foundation/foundation.topbar
//= require rails_db/sticky
//= require rails_db/jquery.cookie
//= require codemirror
//= require codemirror/modes/sql
//= require codemirror/addons/hint/show-hint.js
//= require codemirror/addons/hint/sql-hint.js
//= require rails_db/show_hide_columns.js
//= require rails_db/search.js

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
