class BlogsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "blogs_#{params['blog_id']}_channel" #gleda unutar params i pravi channel sa id-em blog_1_channel
  end

  def unsubscribed #kada user ode sa sajta
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], blog_id: data['blog_id'])
  end
end