OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '364620033719378', 'fb6f92e0b8114cac755ce5bf50fd7e76',
           {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end