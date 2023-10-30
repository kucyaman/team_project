Rails.application.configure do
  config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'https://loguma.onrender.com',
    'Access-Control-Request-Methods' => '*',
    'Access-Control-Request-Headers' => '*'
  }
end