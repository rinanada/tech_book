CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
      config.storage = :fog
      # config.fog_directory  = 'techbook2016'
      # config.asset_host = 'https://s3.amazonaws.com/techbook2016'
    when 'test'
      config.storage = :file
      config.enable_processing = false
    when 'production'
      config.storage = :file
      # config.storage = :fog
      # config.fog_directory  = 'techbook2016'
      # config.asset_host = 'https://s3.amazonaws.com/techbook2016'
    end


end
