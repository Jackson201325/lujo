class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  # version :car_card do
  #   cloudinary_transformation width: 300, height: 150, crop: :thumb
  # end
end
