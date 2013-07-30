OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '199992073496036','0fd67f8676d1344672d2d6f179492711', scope: "email,publish_stream,offline_access"
end