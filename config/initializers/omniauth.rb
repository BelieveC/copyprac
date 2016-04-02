OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '258294501175219', '3da2e49044ac8a8e8ba9fc96cd1ada6d', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end