class WelcomeController < ApplicationController
  skip_before_filter :set_locale
  skip_before_filter :set_mobile_view
  skip_before_filter :inject_preview_style
  skip_before_filter :disable_customization
  skip_before_filter :block_if_maintenance_mode
  skip_before_filter :authorize_mini_profiler
  skip_before_filter :store_incoming_links
  skip_before_filter :preload_json
  skip_before_filter :check_xhr
  skip_before_filter :redirect_to_login_if_required

  def authorize_user_from_smoke_free
    url = "?client_id=#{APP_ID}&client_secret=#{APP_SECRET}&state=active&auth_token=#{params[:auth_token]}"
    response = HTTParty.get("http://95.85.57.155/auth/smoke_free_strategy/access_token.json#{url}")
    parsed_response = JSON.parse(response.body)
    if parsed_response["user"].present?
      login_user(parsed_response["user"])
      redirect_to "/"
    else
      redirect_to "#{SMOKE_FREE_URLS["url"]}"
    end
  end



  private

  def login_user(user_param)
    user = User.find_by_email(user_param["email"])
    if user.blank?
     user =  User.new({:name => user_param["nickname"], :username => user_param["nickname"],
                       :email => user_param["email"]})
     user.save!
     user.reload
     user.update_column(:active, true)
    end
    log_on_user(user)
  end


  def user_params
  params.permit(
    :name,
    :email,
    :password,
    :username
  ).merge(ip_address: request.ip)
  end
end