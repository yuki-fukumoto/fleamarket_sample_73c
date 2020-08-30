crumb :root do
  link "トップページ", root_path
end

crumb :sign_up do
  link "ユーザー登録", new_user_registration_path
end

crumb :sign_in do
  link "ログイン", new_user_session_path
end

crumb :user_show do
  link "マイページ", user_path(current_user)
end

crumb :creditcard_new do
  link "クレジットカード登録", new_creditcard_path
  parent :user_show
end

crumb :creditcard_show do
  link "クレジットカード情報", creditcard_path
  parent :user_show
end

crumb :favorite_index do
  link "お気に入り", item_favorites_path
  parent :user_show
end

crumb :search_index do
  link "検索結果一覧", searches_path
end

crumb :item_show do
  link "商品詳細", item_path(params[:id])
end

crumb :purchase_confirm do
  link "購入確認画面", confirm_purchase_path(params[:id])
  parent :item_show
end

crumb :item_edit do
  link "商品の編集", edit_item_path(params[:id])
  parent :item_show
end

crumb :item_new do
  link "商品の出品", new_item_path
end

crumb :users_bought_items do
  link "購入した商品", bought_items_users_path
  parent :user_show
end

crumb :users_sale_items do
  link "出品中の商品", sale_items_users_path
  parent :user_show
end

crumb :users_sold_items do
  link "販売済の商品", sold_items_users_path
  parent :user_show
end

crumb :browsing_histories do
  link "閲覧履歴", browsing_histories_path
  parent :user_show
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
