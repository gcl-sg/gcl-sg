class GclFooterRenderer < SimpleNavigation::Renderer::List
  # TODO: 能否过滤掉首页那个节点不显示

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