CarrierWave.configure do |config|
  config.ignore_integrity_errors = false
  config.ignore_processing_errors = false
  config.ignore_download_errors = false
  config.root = "#{Dir.pwd}/public" 


  if Rails.env.staging? || Rails.env.production?
	config.fog_credentials = {
    	:provider                         => 'Google',
    	:google_storage_access_key_id     => ENV['GCS_ID'],
    	:google_storage_secret_access_key => ENV['GCS_SECRET'],
    }

    config.fog_directory = 'nomster-assaf-rahav-photos'
  else
    config.storage = :file
  end
end