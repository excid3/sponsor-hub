require 'neatjson'

class GithubWebhooksController < ApplicationController
  protect_from_forgery with: :null_session, only: [:sponsored]

  def sponsored
    payload = JSON.parse(params['payload'])
    Rails.logger.debug "Sponsored Webhook payload\n#{JSON.neat_generate(
      payload, sort: true, wrap: 40, aligned: true, around_colon: 1)}"
    add_sponsorship(payload)
    render nothing: true, layout: false, status: :ok
  end

  private

  def add_sponsorship(payload)
    Rails.logger.debug "TODO: Add new github account for sponsor and associated sponsorship models"
    Rails.logger.debug "TODO: Add Sponsor Github Account"
    Rails.logger.debug "TODO: Add Sponsor and Creators for their respective Github Accounts"
    Rails.logger.debug "TODO: Add Tier and Sponsorship"
    Rails.logger.debug "TODO: Find and associate any app user associated with either Creator or Sponsor"
  end
end
