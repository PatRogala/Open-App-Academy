module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
      <input
        type="hidden"
        name="authenticity_token"a
        value="#{form_authenticity_token}">
    HTML
  end
end
