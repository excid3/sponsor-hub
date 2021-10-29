class GithubWebhooksController < ApplicationController
  protect_from_forgery with: :null_session, only: [:sponsored]
  #protect_from_forgery with: :null_session

  def sponsored
    puts "\n***\nsponsered: params\n#{params}\n***\n"
    render nothing: true, layout: false, status: :ok
  end
end
