# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(text)
    content_tag(:h1, content_for(:title) { h text })
  end
  
  def link_to_show(url, options = {})
    link_to 'show', url, options
  end
  
  def link_to_edit(url, options = {})
    link_to 'edit', url, options
  end
  
  def link_to_destroy(url, options = {})
    options.reverse_merge!(:method => :delete, :confirm => "This can't be undone. Really delete?")
    link_to 'delete', url, options
  end
end
