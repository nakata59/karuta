require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
require 'dotenv'
Dotenv.load

CarrierWave.configure do |config|

    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1'
    }


    config.fog_directory  = 'karuta-app'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/karuta-app'

end