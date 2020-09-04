$(document).on("turbolinks:load", function () {
  function buildHTML(comment){
    let html =
      `<div class='comments__area'>
          <div class='comment_creater'>
            <div class='comment_name'>${comment.user_name}</div>
            <div class='comment_date'>${comment.created_at}</div>
          </div>
          <div class='comment_text'>${comment.text}</div>
      </div>`
    return html;
  } 
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action')

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    
  .done(function(data){
    
    let html = buildHTML(data);
    
    $('.comments').prepend(html);
    
    $('.commentBox textarea').val('');

    //$('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});

    $('.commentBox input').prop('disabled', false);
    
    //$('150文字').replaceWith('.js-text-count pull-right');
   
  })

    .fail(function(){
      alert('コメントを入力してください');
    })
  })
  
  var count = $(".js-text").text().replace(/\n/g, "改行").length;
  var now_count = 150 - count;
  if (count > 150) {
    $(".js-text-count").css("color", "red");
  }
  $(".js-text-count").text("残り" + now_count + "文字");

  $(".js-text").on("keyup", function () {
    var count = $(this).val().replace(/\n/g, "改行").length;
    var now_count = 150 - count;

    if (count > 150) {
      $(".js-text-count").css("color", "red");
    } else {
      $(".js-text-count").css("color", "black");
    }
    $(".js-text-count").text("残り" + now_count + "文字");
  });
});