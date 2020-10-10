module Api::V1
  class UsersController < ApiController
    # GET /v1/users
    include ActionController::MimeResponds
    def index
      render json: User.all
    end
    def reset
        User.all.each do |u|
           u.token = 10000
           u.save!
        end
        respond_to do |format|
           msg = { :status => "ok", :message => "Success!" }
           format.json  { render :json => msg } # don't do msg.to_json
        end
    end
    def get_amounts
        @token= User.find(params[:id]).token
        respond_to do |format|
           msg = { :status => "ok", :message => "Success", :token =>@token }
           format.json  { render :json => msg } # don't do msg.to_json
        end
    end

    def transfer
        @user_transfer_from= User.find(params[:transfer_from])
        @user_transfer_to= User.find(params[:transfer_to])
		@user_transfer_from.token -= params[:amount].to_f
		@user_transfer_to.token += params[:amount].to_f
		@user_transfer_from.save!
		@user_transfer_to.save!
        respond_to do |format|
           msg = { :status => "ok", :message => "Success", :user_transfer_from_token =>@user_transfer_from.token,:user_transfer_to_token =>@user_transfer_to.token }
           format.json  { render :json => msg } # don't do msg.to_json
        end
    end
  end
end