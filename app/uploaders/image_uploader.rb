class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  if Rails.env.production?
    include Cloudinary::CarrierWave

    process :convert => 'png'
    process :tags => ['ezuka2018']

    process :resize_to_limit => [1000, 1000]

    def public_id
      return "ezuka2018/" + Cloudinary::Utils.random_public_id;
    end
  else
    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
end
