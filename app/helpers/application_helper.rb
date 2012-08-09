module ApplicationHelper
  
  def login_path
    "/auth/twitter"
  end
  
  def include_ace_javascript
    javascript_include_tag "ace", "mode-javascript", "theme-textmate"
  end
  
end