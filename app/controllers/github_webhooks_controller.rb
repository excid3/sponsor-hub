require 'neatjson'

class GithubWebhooksController < ApplicationController
  protect_from_forgery with: :null_session, only: [:sponsored]
  #protect_from_forgery with: :null_session

  def sponsored
    puts "\n***\nsponsered: params\n#{params}\n***\n"

    puts "\n\n*** json ***\n"
    payload = JSON.parse(params['payload'])

    puts JSON.neat_generate(payload, sort: true, wrap: 40, aligned: true, around_colon: 1)

    render nothing: true, layout: false, status: :ok
  end
end
