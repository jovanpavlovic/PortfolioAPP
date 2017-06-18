module ApplicationHelper
  def login_helper style = '' #po defaultu stil ce biti podesen, prazan string
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper (layout_name)
     if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}amd you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")#ako user dodje na sajt sa fb, twittera... bice thanks for visiting me from
    end
  end

  def copyright_generator
    DevcampViewTool::Renderer.copyright 'Jovan Pavlovic', 'All rights reserved'#pavlovic_view_tool gem
  end
end