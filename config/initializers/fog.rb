GoogleStorage = Fog::Storage::Google.new(
	:google_project => 'genuine-ridge-242303',
	:google_client_email => 'foo@bar.com',
	:google_json_key_string => ENV['GCS_KEY_JSON'],
)