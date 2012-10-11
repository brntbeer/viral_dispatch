Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook
  #provider :twitter
  provider :github, ENV["GITHUB_KEY"], ENV["GITHUB_SECRET"]
end

