$(function(){
  $('body').on('click', '.close-modal', function() {
    $("a.close-reveal-modal").trigger("click");
  });
});
