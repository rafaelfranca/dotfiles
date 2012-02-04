// Need http://defunkt.io/dotjs/ to work

(function() {
  var $button = $('<a><span>Delete all notifications</span></a>').addClass('minibutton').
    attr('href', 'javascript:$("#inbox").find(".del a").click()').
    css('margin-left', '10px').
    css('float', 'right');

  $('#inbox').find('.list').children('p').append($button);
})();

