class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
      

  include ApplicationHelper

  private
  # 以下の1行は消さないでください
  def default_url_options() {instanceId: 'c2497291e8'}.merge(super) end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end 
  
  before_action do
    RecordWithOperator.operator = current_user
  end
  
end
