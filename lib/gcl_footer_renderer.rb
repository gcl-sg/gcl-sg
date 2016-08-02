class GclFooterRenderer < SimpleNavigation::Renderer::List
  # TODO: 能否过滤掉首页那个节点不显示

  def render(item_container)
    if item_container.empty?
      ''
    else
      if item_container.level == 1
        render_top_level item_container.items
      else
        super

      end
    end
  end

  protected

  def tag_for(item)
    super
  end

  private

  def list_content(item_container)
    super
  end

  def render_top_level(items)
    not_blank_items = []
    items.each {|item| not_blank_items.push(item) if include_sub_navigation?(item)}
    not_blank_items.each_slice(3).map do |group|
      group_content = group.map do |item|
        title = content_tag :dt, item.name
        content = content_tag :dd, render_sub_navigation_for(item)
        content_tag :dl, title + content
      end.join
      content_tag :div, group_content, class: 'group'
    end.join.html_safe

    # items.map { |item|
    #   li_options = item.html_options.except(:link)
    #   li_content = tag_for(item)
    #   if include_sub_navigation?(item)
    #     li_content << render_sub_navigation_for(item)
    #   end
    #   content_tag(:li, li_content, li_options)
    # }.join
  end
end