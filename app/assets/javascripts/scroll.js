$(document).on('turbolinks:load', function() {
  $('.topiclists').jscroll({
    contentSelector: '.jscroll',
    nextSelector: 'a.next',
    loadingHtml: 'now loading',
    autoTrigger: true,
    padding: 20,
  });
});