# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Admin account"
User.find_or_create_by!(username: 'admin') do |user|
  user.email = "admin@example.com"
  user.password = "nandudu"
  user.password_confirmation = "nandudu"
end

puts "Creating default site categories"
category_data = [
    {id: 1, sort: 1, visible: true, code: 'about_us', name_en: 'About Us', name_zh_CN: '关于我们', name_zh_TW: '關於我們'},
    {id: 2, sort: 2, visible: true, code: 'product_and_service', name_en: 'Product & Service', name_zh_CN: '产品与服务', name_zh_TW: '產品與服務'},
    {id: 3, sort: 3, visible: true, code: 'project', name_en: 'Project', name_zh_CN: '项目案例', name_zh_TW: '項目案例'},
    {id: 4, sort: 4, visible: true, code: 'news', name_en: 'News Center', name_zh_CN: '新闻中心', name_zh_TW: '新聞中心'},
    {id: 5, sort: 5, visible: true, code: 'csr', name_en: 'CSR', name_zh_CN: '社会责任', name_zh_TW: '社會責任'},
    {id: 6, sort: 6, visible: true, code: 'investor_relations', name_en: 'Investor Relations', name_zh_CN: '投资者关系', name_zh_TW: '投資者關係'},
    {id: 7, sort: 7, visible: true, code: 'careers', name_en: 'Careers', name_zh_CN: '招贤纳士', name_zh_TW: '招賢納士'},
]
category_data.each do |category_hash|
  category = Category.find_or_initialize_by(id: category_hash[:id])
  category.sort = category_hash[:sort]
  category.visible = category_hash[:visible]
  category.code = category_hash[:code]
  category.name_en = category_hash[:name_en]
  category.name_zh_CN = category_hash[:name_zh_CN]
  category.name_zh_TW = category_hash[:name_zh_TW]
  category.save
end
