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
  user.password = Rails.application.secrets.admin_password
  user.password_confirmation = Rails.application.secrets.admin_password
end

puts "Creating default site categories"
category_data = JSON.parse(File.read([Rails.root, '/db/fixtures/category/categories.json'].join('')))
category_data.each do |category_hash|
  category_hash.deep_symbolize_keys!
  category = Category.find_or_initialize_by(id: category_hash[:id])
  category.sort = category_hash[:sort]
  category.visible = category_hash[:visible]
  category.code = category_hash[:code]
  category.name_en = category_hash[:name_en]
  category.name_zh_cn = category_hash[:name_zh_cn]
  category.name_zh_tw = category_hash[:name_zh_tw]
  category.cover = File.open([Rails.root, '/db/fixtures/category/', 'cover_', category_hash[:id], '.jpg'].join(''))
  category.save
end
puts "Total category count: #{Category.count}"


puts "creating sites"
site_data = JSON.parse(File.read([Rails.root, '/db/fixtures/site/sites.json'].join('')))
site_data.each do |site_hash|
  site_hash.deep_symbolize_keys!
  site = Site.find_or_initialize_by(id: site_hash[:id])
  site.category_id = site_hash[:category_id]
  site.sort = site_hash[:sort]
  site.visible = site_hash[:visible]
  site.title_en = site_hash[:title_en]
  site.title_zh_cn = site_hash[:title_zh_cn]
  site.title_zh_tw = site_hash[:title_zh_tw]
  site.body_en = site_hash[:body_en]
  site.body_zh_cn = site_hash[:body_zh_cn]
  site.body_zh_tw = site_hash[:body_zh_tw]
  site.url = site_hash[:url]
  site.save
end
puts "Total site count: #{Site.count}"

puts "creating linkages"
linkage_data = JSON.parse(File.read([Rails.root, '/db/fixtures/linkage/linkages.json'].join('')))
linkage_data.each do |linkage_hash|
  linkage_hash.deep_symbolize_keys!
  linkage = Linkage.find_or_initialize_by(id: linkage_hash[:id])
  linkage.sort = linkage_hash[:sort]
  linkage.visible = linkage_hash[:visible]
  linkage.title_en = linkage_hash[:title_en]
  linkage.title_zh_cn = linkage_hash[:title_zh_cn]
  linkage.title_zh_tw = linkage_hash[:title_zh_tw]
  linkage.url_en = linkage_hash[:url_en]
  linkage.url_zh_cn = linkage_hash[:url_zh_cn]
  linkage.url_zh_tw = linkage_hash[:url_zh_tw]
  linkage.save
end
puts "Total linkage count: #{Linkage.count}"

puts "creating news"
news_data = JSON.parse(File.read([Rails.root, '/db/fixtures/news/news.json'].join('')))
news_data.each do |news_hash|
  news_hash.deep_symbolize_keys!
  news = News.find_or_initialize_by(id: news_hash[:id])
  news.category = news_hash[:category]
  news.published_at = news_hash[:published_at]
  news.visible = news_hash[:visible]
  news.title_en = news_hash[:title_en]
  news.title_zh_cn = news_hash[:title_zh_cn]
  news.title_zh_tw = news_hash[:title_zh_tw]
  news.body_en = news_hash[:body_en]
  news.body_zh_cn = news_hash[:body_zh_cn]
  news.body_zh_tw = news_hash[:body_zh_tw]
  news.cover = File.open([Rails.root, '/db/fixtures/news/', 'news_', news_hash[:id] % 2, '.jpg'].join(''))
  news.save
end
puts "Total news count: #{News.count}"

puts "ceating albums"
10.times do |i|
  album = Album.find_or_initialize_by(id: i)
  album.visible = true
  album.published_at = rand(100).days.ago
  album.title_en = "GCL SG Brochure#{i}"
  album.title_zh_cn = "宣传册 #{i}"
  album.title_zh_tw = "宣傳則 #{i}"
  album.cover_en = File.open([Rails.root, '/db/fixtures/album/cover.png'].join(''))
  album.cover_zh_cn = File.open([Rails.root, '/db/fixtures/album/cover.png'].join(''))
  album.cover_zh_tw = File.open([Rails.root, '/db/fixtures/album/cover.png'].join(''))
  album.file_en = File.open([Rails.root, '/db/fixtures/album/brochure.pdf'].join(''))
  album.file_zh_cn = File.open([Rails.root, '/db/fixtures/album/brochure.pdf'].join(''))
  album.file_zh_tw = File.open([Rails.root, '/db/fixtures/album/brochure.pdf'].join(''))
  album.save
end
puts "Total album count: #{Album.count}"

puts "ceating videos"
10.times do |i|
  video = Video.find_or_initialize_by(id: i)
  video.visible = true
  video.published_at = rand(100).days.ago
  video.title_en = "GCL SG Video #{i}"
  video.title_zh_cn = "宣传视频 #{i}"
  video.title_zh_tw = "宣傳視頻 #{i}"
  video.cover_en = File.open([Rails.root, '/db/fixtures/video/video.jpg'].join(''))
  video.cover_zh_cn = File.open([Rails.root, '/db/fixtures/video/video.jpg'].join(''))
  video.cover_zh_tw = File.open([Rails.root, '/db/fixtures/video/video.jpg'].join(''))
  video.file_en = File.open([Rails.root, '/db/fixtures/video/video.mp4'].join(''))
  video.file_zh_cn = File.open([Rails.root, '/db/fixtures/video/video.mp4'].join(''))
  video.file_zh_tw = File.open([Rails.root, '/db/fixtures/video/video.mp4'].join(''))
  video.save
end
puts "Total videos count: #{Video.count}"

puts "creating banner"
banner_data = JSON.parse(File.read([Rails.root, '/db/fixtures/banner/banners.json'].join('')))
banner_data.each do |banner_hash|
  banner_hash.deep_symbolize_keys!
  banner = Banner.find_or_initialize_by(id: banner_hash[:id])
  banner.sort = banner_hash[:sort]
  banner.visible = banner_hash[:visible]
  banner.title_en = banner_hash[:title_en]
  banner.title_zh_cn = banner_hash[:title_zh_cn]
  banner.title_zh_tw = banner_hash[:title_zh_tw]
  banner.description_en = banner_hash[:description_en]
  banner.description_zh_cn = banner_hash[:description_zh_cn]
  banner.description_zh_tw = banner_hash[:description_zh_tw]
  banner.url = banner_hash[:url]
  banner.cover = File.open([Rails.root, '/db/fixtures/banner/', 'cover_', banner_hash[:id], '.jpg'].join(''))
  banner.save
end
puts "Total banner count: #{Banner.count}"

puts "creating plate"
plate_data = JSON.parse(File.read([Rails.root, '/db/fixtures/plate/plates.json'].join('')))
plate_data.each do |plate_hash|
  plate_hash.deep_symbolize_keys!
  plate = Plate.find_or_initialize_by(id: plate_hash[:id])
  plate.sort = plate_hash[:sort]
  plate.visible = plate_hash[:visible]
  plate.title_en = plate_hash[:title_en]
  plate.title_zh_cn = plate_hash[:title_zh_cn]
  plate.title_zh_tw = plate_hash[:title_zh_tw]
  plate.sub_title_en = plate_hash[:sub_title_en]
  plate.sub_title_zh_cn = plate_hash[:sub_title_zh_cn]
  plate.sub_title_zh_tw = plate_hash[:sub_title_zh_tw]
  plate.desc_en = plate_hash[:desc_en]
  plate.desc_zh_cn = plate_hash[:desc_zh_cn]
  plate.desc_zh_tw = plate_hash[:desc_zh_tw]
  plate.url = plate_hash[:url]
  plate.color = plate_hash[:color]
  plate.image = File.open([Rails.root, '/db/fixtures/plate/', 'image_', plate_hash[:id], '.jpg'].join(''))
  plate.save
end
puts "Total plate count: #{Plate.count}"

puts "creating business"
business_data = JSON.parse(File.read([Rails.root, '/db/fixtures/business/businesses.json'].join('')))
business_data.each do |business_hash|
  business_hash.deep_symbolize_keys!
  business = Business.find_or_initialize_by(id: business_hash[:id])
  business.sort = business_hash[:sort]
  business.visible = business_hash[:visible]
  business.title_en = business_hash[:title_en]
  business.title_zh_cn = business_hash[:title_zh_cn]
  business.title_zh_tw = business_hash[:title_zh_tw]
  business.description_en = business_hash[:description_en]
  business.description_zh_cn = business_hash[:description_zh_cn]
  business.description_zh_tw = business_hash[:description_zh_tw]
  business.url = business_hash[:url]
  business.cover = File.open([Rails.root, '/db/fixtures/business/', 'business_', business_hash[:id], '.jpg'].join(''))
  business.save
end
puts "Total business count: #{Business.count}"

puts "creating company profile"
company_profile_data = JSON.parse(File.read([Rails.root, '/db/fixtures/company_profile/company_profiles.json'].join('')))
company_profile_data.each do |company_profile_hash|
  company_profile_hash.deep_symbolize_keys!
  company_profile = CompanyProfile.find_or_initialize_by(id: company_profile_hash[:id])
  company_profile.sort = company_profile_hash[:sort]
  company_profile.visible = company_profile_hash[:visible]
  company_profile.title_en = company_profile_hash[:title_en]
  company_profile.title_zh_cn = company_profile_hash[:title_zh_cn]
  company_profile.title_zh_tw = company_profile_hash[:title_zh_tw]
  company_profile.description_en = company_profile_hash[:description_en]
  company_profile.description_zh_cn = company_profile_hash[:description_zh_cn]
  company_profile.description_zh_tw = company_profile_hash[:description_zh_tw]
  company_profile.cover = File.open([Rails.root, '/db/fixtures/company_profile/', 'company_profile_', company_profile_hash[:id], '.jpg'].join(''))
  company_profile.save
end
puts "Total company profile count: #{CompanyProfile.count}"

ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
