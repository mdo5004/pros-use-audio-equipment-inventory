Rails.application.config.middleware.use OmniAuth::Builder do
    #  provider :developer unless Rails.env.production?
    provider :facebook, "1539694982730541", '03eccce6e46506500da82b68d4fae0d0'
#    provider :twitter, "API_KEY", "API_SECRET"

end