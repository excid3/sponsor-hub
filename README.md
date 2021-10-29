# README

## Development Environment
### https is required for github sponsor webhook
- currently using https://ngrok.com/ to create public url for https://localhost
- added to `config.hosts` to permit callback
- configured in `config/environments/development.rb`
   - checked in order:   
      1. environment variable `HTTPS_LOCALHOST`
      2. `config/connections.yml`

### web-console requires setting allowed ips 
- **github webhook callback ips** are added to `config.web_console.allowed_ips`  
- gem https://github.com/rails/web-console
- see `config/application.rb`

 