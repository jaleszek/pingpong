class TokenSessionsController < InheritedResources::Base
  protect_from_forgery with: :null_session
  respond_to :json
  actions :create

  def create
    if from_omniauth?
      auth = request.env['omniauth.auth']
      authentication = OmniauthAuthentication.new(auth)  
      @user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || authentication.create     
    else
      @user = User.find_by_email(params[:email])
    end

    if (@user && !from_omniauth? && @user.valid_password?(params[:password])) || (from_omniauth? && @user)
      token = AuthenticationToken.find_or_create_for(@user)

      response = { json: { user_id: @user.id, auth_token: token.auth_token } }
    else
      response = { json: { errors: "invalid_credentials" }, status: :unauthorized }
    end

    unless from_omniauth?
      respond_to do |format|
        format.json { render(response) }
      end
    else
      redirect_to "/#/gists?auth_token=#{token.auth_token}" if token
    end
  end

  private

  def from_omniauth?
    params[:email].nil? || params[:password].nil?
  end
end
