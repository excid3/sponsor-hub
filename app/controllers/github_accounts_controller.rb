class GithubAccountsController < ApplicationController
  before_action :authenticate_user!
  def index
    render 'index', locals: { github_accounts: current_user.github_accounts }
  end
end