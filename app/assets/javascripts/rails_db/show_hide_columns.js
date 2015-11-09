$(function(){
  $(document).foundation();

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

