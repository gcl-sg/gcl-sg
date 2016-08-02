class GclBreadcrumbsRenderer < SimpleNavigation::Renderer::Breadcrumbs
  def render(item_container)
    super
  end

  protected

  def a_tags(item_container)
    super
  end

  def join_with
    @join_with ||= options[:join_with] || '&gt;'
  end

  def suppress_link?(item)
    super
  end

  def prefix_for(content)
    super
  end

  # Extracts the options relevant for the generated link
  #
  def link_options_for(item)
    super
  end
end