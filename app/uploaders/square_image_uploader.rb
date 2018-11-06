class SquareImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  def extension_white_list
    %w(jpg jpeg png)
  end

  process :resize_to_fill => [1000, 1000]

  if Rails.env.production?
    include Cloudinary::CarrierWave

    process :convert => 'png'
    process :tags => ['ezuka2018']


    def public_id
      return "ezuka2018/" + Cloudinary::Utils.random_public_id;
    end
  else
    storage :file

    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
  end
  def cache_dir
    'cache'
  end
end
