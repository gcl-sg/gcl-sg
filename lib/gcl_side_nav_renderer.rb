class GclSideNavRenderer < SimpleNavigation::Renderer::List
  # TODO: 只显示当前选中的一级和二级菜单,其他未选中的菜单应该不显示

  def render(item_container)
    # super
    if item_container.level == 1
      render_active_nav(item_container)
    else
      super
    end
  end

  protected

  def tag_for(item)
    super
  end

  private

  def list_content(item_container)
    item_container.items.map { |item|
      li_options = item.html_options.except(:link)
      li_content = tag_for(item)
      if include_sub_navigation?(item)
        li_content << render_sub_navigation_for(item)
      end
      content_tag(:li, li_content, li_options)
    }.join
  end

  def render_active_nav(item_container)
    active_item = item_container.items.find { |item| item.selected? }
    li_options = active_item.html_options.except(:link)
    li_content = tag_for(active_item)
    if include_sub_navigation?(active_item)
      li_content << render_sub_navigation_for(active_item)
    end
    content_tag :ul, content_tag(:li, li_content, li_options), {class: 'side-nav'}

  end
end