GoogleStorage = Fog::Storage.new(
	provider: 'Google',
	google_project: 'genuine-ridge-242303',
	google_json_key_string: ENV['GCS_KEY_JSON'],
)