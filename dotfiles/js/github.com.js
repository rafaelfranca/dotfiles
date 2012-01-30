// Need http://defunkt.io/dotjs/ to work

(function() {
  var $inbox = $("#inbox");

  var $button = $('<a><span>Delete all</span></a>').
    addClass('minibutton').
    attr('href', 'javascript:;').
    css('margin-left', '10px').
    css('float', 'right').
    on('click', function() {
      $('.del', $inbox).find('a').click();
      $inbox.ajaxStop(function() {
        location.reload(true);
      });
    });

  $('.list', $inbox).children('p').append($button);
})();
