crumb :root do
  link t('navbar.home'), root_path
end

crumb :categories do
  link t('navbar.categories'), categories_path
end

crumb :category do |category|
  link "#{category.name}", category_path(category)
  parent :categories
end

crumb :products do
  link t('navbar.products'), products_path
end

crumb :product do
  link "#{product.title}", product_path(product)
  parent :products
end

crumb :users do
  link t('navbar.users')
end

crumb :user do
  link "#{user.firstname} #{user.lastname}", user_path(user) 
  parent :users
end
