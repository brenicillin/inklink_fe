Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, "510841049656-dan93jl9d2a24itrpvnri1b7i4d736k4.apps.googleusercontent.com", "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"
  end
OmniAuth.config.allowed_request_methods = [:get]