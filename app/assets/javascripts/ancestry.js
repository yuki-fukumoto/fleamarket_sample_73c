$(document).on("turbolinks:load", function () {
  // When selected main category, this method start.
  $("select[name='item[category_id]']").change(function () {
    $(".form_category").eq(2).remove();
    $(".form_category").eq(1).remove();

    var ancestry = $(this).find("option:selected").val();
    $.ajax({
      type: "get",
      url: "/categories/get_child",
      data: {
        ancestry: ancestry,
      },
      dataType: "json",
    }).done(function (categories) {
      var html = "";

      html += `<div class="container category_1__container"><div class="title"></div><div class="column form_category"><select name="item[category_id]" id="item[category_id]" class="category_1 text_box"><option value="${ancestry}">サブカテゴリを選ぶ</option>`;

      $.each(categories, function (i, category) {
        html += `<option value="${category.id}" ancestry="${category.ancestry}">${category.name}</option>`;
      });

      html += `</select></div></div>`;
      $(".category_0__container").after(html);
      $(".form_category").eq(1).hide().fadeIn(300);
    });
  });

  // When selected sub category, this method start.
  $(document).on("change", ".category_1", function () {
    $(".form_category").eq(2).remove();
    var parent = $(this).find("option:selected").val();
    var ancestry =
      $(this).find("option:selected").attr("ancestry") +
      "/" +
      $(this).find("option:selected").val();

    $.ajax({
      type: "get",
      url: "/categories/get_child",
      data: {
        ancestry: ancestry,
      },
      dataType: "json",
    }).done(function (categories) {
      var html = "";

      html += `<div class="container category_2__container"><div class="title"></div><div class="column form_category"><select name="item[category_id]" id="item[category_id]" class="category_2 text_box"><option value="${parent}">サブカテゴリを選ぶ</option>`;
      $.each(categories, function (i, category) {
        html += `<option value="${category.id}" ancestry="${category.ancestry}">${category.name}</option>`;
      });

      html += `</select></div></div>`;
      $(".category_1__container").after(html);
      $(".form_category").eq(2).hide().fadeIn(300);
    });
  });
});
