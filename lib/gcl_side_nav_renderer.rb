class GclSideNavRenderer < SimpleNavigation::Renderer::List
  # TODO: 只显示当前选中的一级和二级菜单,其他未选中的菜单应该不显示

  def render(item_container)
    super
  end

  protected

  def tag_for(item)
    super
  end

  private

  def list_content(item_container)
    super
  end
end