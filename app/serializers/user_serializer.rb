# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image_url

  def image_url
    # Ensure the image is attached before trying to generate a URL
    if object.image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(object.image, only_path: true)
    else
      nil
    end
  end
end
