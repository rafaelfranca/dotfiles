// ==UserScript==
// @name                GitHub delete all notifications button
// @namespace	        http://www.github.com/micolous/delete-all-notifications
// @description	        Adds a button to allow you to delete all notifications on a page.
// @include		http://github.com/inbox/notifications*
// @include		https://github.com/inbox/notifications*
// ==/UserScript==
/*

Sick of hipster jerks posting in commit or issue threads, and you made the
mistake of contributing something useful in it?  This userscript (also Chrome
compatible) gives you a handy button to delete all of the notifications on a
page.  Just visit the notifications page, and this will give you a button to
handily delete their crap.

*/

(function() {
  var $button = $('<a><span>Delete all notifications</span></a>').addClass('minibutton').
    attr('href', 'javascript:$("#inbox").find(".del a").click()').
    css('margin-left', '10px').
    css('float', 'right');

  $('#inbox').find('.list').children('p').append($button);
})();

