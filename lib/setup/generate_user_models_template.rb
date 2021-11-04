# frozen_string_literal: true

# To run this template use the following command
# bin/rails app:template LOCATION="lib/setup/generate_user_models_template.rb"

GITHUB_ACCOUNT_CLASS_INJECTION = <<-'CODE'.freeze
  has_one :creator, dependent: :destroy
  has_one :supporter, dependent: :destroy
CODE

CREATOR_CLASS_INJECTION = <<-'CODE'.freeze
  has_many :tiers, dependent: :destroy
  has_many :sponsorships, dependent: :destroy
  has_many :supporters, through: :sponsorships
CODE

SUPPORTER_CLASS_INJECTION = <<-'CODE'.freeze
  has_many :sponsorships, dependent: :destroy
  has_many :creators, through: :sponsorships
CODE

def generate_user_models
  generate :model, %w[GithubAccount name:string ghid:string:uniq login:string:uniq email:string:uniq
                      image:string token:string user:references]
  generate :model, %w[Supporter github_account:references]
  generate :model, %w[Creator github_account:references]
  generate :model, %w[Tier name:string ghid:string:uniq creator:references]
  generate :model, %w[Sponsorship tier:references supporter:references creator:references $options]

  inject_into_class('app/models/github_account.rb', 'GithubAccount', GITHUB_ACCOUNT_CLASS_INJECTION)
  inject_into_class('app/models/creator.rb', 'Creator', CREATOR_CLASS_INJECTION)
  inject_into_class('app/models/supporter.rb', 'Supporter', SUPPORTER_CLASS_INJECTION)
end

generate_user_models
