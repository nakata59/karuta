require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'


CarrierWave.configure do |config|

    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAWOZ74Q4CSWUAC3TE',
    aws_secret_access_key: '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',
    region: 'ap-northeast-1'
    }


    config.fog_directory  = 'karuta-app'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/karuta-app'

end