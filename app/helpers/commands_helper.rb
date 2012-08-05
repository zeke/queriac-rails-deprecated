module CommandsHelper
  
  def favicon(command)
    return "" if command.domain.nil?
    image_tag(command.domain.favicon_url_for_domain)
  end
  
end
