Rails.application.configure do
  config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'http://localhost:8000',
    'Access-Control-Request-Methods' => '*',
    'Access-Control-Request-Headers' => '*'
  }
end