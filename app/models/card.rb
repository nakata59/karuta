class Card < ApplicationRecord
    mount_uploader :audio, AudioFileUploader
    mount_uploader :image, ImageUploader
end
