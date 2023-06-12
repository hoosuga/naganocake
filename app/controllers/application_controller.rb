class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    customer_show_path(resource)
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      root_path
    elsif resource_or_scope == :admin
      new_admin_session_path
    else
      root_path
    end
  end
end