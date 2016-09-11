class UserDecorator < Draper::Decorator
  delegate_all

  def get_picture
    if object.picture_url
      object.picture_url
    else
      'avatar.jpg'
    end
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
