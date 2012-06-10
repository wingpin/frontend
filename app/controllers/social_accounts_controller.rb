class SocialAccountsController < ApplicationController
  respond_to :json
  
  def create
    @itenerary = Itenerary.find(params[:itenerary_id])
    @token = params['social_account']['token'].split('=')[-1]
    social_account = @itenerary.social_accounts.build(:account_type => params['social_account']['account_type'], :token => @token)
    if social_account.valid?
      social_account.save
      {}.to_json
    else
      {}.to_json
    end
  end
end
