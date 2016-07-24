class Category < ActiveHash::Base
  include ActiveHash::Associations

  has_many :sites

  fields :id, :sort, :visible, :code, :en_name, :name_zh_CN, :name_zh_TW
  self.data = [
      {id: 1, sort: 1, visible: true, code: 'about_us', en_name: 'About Us', name_zh_CN: '关于我们', name_zh_TW: '關於我們'},
      {id: 2, sort: 2, visible: true, code: 'product_and_service', en_name: 'Product & Service', name_zh_CN: '产品与服务', name_zh_TW: '產品與服務'},
      {id: 3, sort: 3, visible: true, code: 'project', en_name: 'Project', name_zh_CN: '项目案例', name_zh_TW: '項目案例'},
      {id: 4, sort: 4, visible: true, code: 'news', en_name: 'News Center', name_zh_CN: '新闻中心', name_zh_TW: '新聞中心'},
      {id: 5, sort: 5, visible: true, code: 'csr', en_name: 'CSR', name_zh_CN: '社会责任', name_zh_TW: '社會責任'},
      {id: 6, sort: 6, visible: true, code: 'investor_relations', en_name: 'Investor Relations', name_zh_CN: '投资者关系', name_zh_TW: '投資者關係'},
      {id: 7, sort: 7, visible: true, code: 'careers', en_name: 'Careers', name_zh_CN: '招贤纳士', name_zh_TW: '招賢納士'},
  ]

  def self.visible
    all.select{|item| item.visible?}.sort_by(&:sort)
  end

  # name according to the locale
  def name
    case I18n.locale
      when :'zh-CN'
        name_zh_CN
      when :'zh-TW'
        name_zh_TW
      when :en
        en_name
      else
        en_name
    end
  end
end