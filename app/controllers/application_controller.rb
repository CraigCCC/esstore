class ApplicationController < ActionController::Base
  def after_sign_in_path_for(user)
    if user.role == 'admin'
      admin_root_path
    else
      root_path
    end
  end
end
