//= require rails_db/jquery
//= require rails_db/jquery.cookie
//= require rails_db/rails-ujs
//= require rails_db/foundation.min
//= require rails_db/sticky
//= require rails_db/show_hide_columns.js
//= require rails_db/search.js
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

function set_browser_url(url) {
  if (typeof (history.pushState) != "undefined") {
    window.history.pushState({"path": url}, '', url);
  }
}

$(window).bind('popstate', function(event) {
  if (typeof (history.pushState) != "undefined") {
    var state = event.originalEvent.state;
    if (state) {
      window.location = state.path;
    }
  }
});