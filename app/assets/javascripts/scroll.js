$(document).on('turbolinks:load', function(){
  $('.topiclists.no1').jscroll({
    loadingHtml: 'now loading',
    autoTrigger: true,
    nextSelector: 'a.next',
    contentSelector: '.jscroll',
    padding: 20,
  });
});