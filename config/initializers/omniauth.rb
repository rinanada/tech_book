Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
    Rails.application.secrets.twitter_api_key,
    Rails.application.secrets.twitter_api_secret
  provider :facebook,
    Rails.application.secrets.facebook_id,
    Rails.application.secrets.facebook_secret_key, scope: 'email,status_update,publish_actions'
end

