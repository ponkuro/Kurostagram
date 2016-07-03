# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  if Rails.env.production?
    include Cloudinary::CarrierWave

    def public_id
      return model.id
    end
  else # development, test
    # Choose what kind of storage to use for this uploader:
    storage :file
    
    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
    
    include CarrierWave::RMagick
  end

  # 画像の上限を120pxにする
  process :resize_to_limit => [120, 120]

  # 保存形式をJPGにする
  process :convert => 'jpg'

  # サムネイルを生成する設定
  version :small do
    process :resize_to_limit => [80, 80]
  end
  
  # サムネイルを生成する設定
  version :mini do
    process :resize_to_limit => [40, 40]
  end

  # jpg,jpeg,gif,pngしか受け付けない
  def extension_white_list
    %w(jpg jpeg gif png)
  end
  
end