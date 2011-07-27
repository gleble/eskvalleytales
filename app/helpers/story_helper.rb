module StoryHelper
# Return true if hiding the edit links for spec, FAQ, etc.
  def hide_edit_links?
    not @hide_edit_links.nil?
  end
end
