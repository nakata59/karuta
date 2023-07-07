class Karutum < ApplicationRecord
  mount_uploader :audio, AudioFileUploader
  mount_uploader :image, ImageUploader
  belongs_to :title
end
