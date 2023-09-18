# frozen_string_literal: true


class ManageController < ApplicationController
  # def after_sign_in_path_for(resource)
  #   admin_path
  # end

  # def after_sign_out_path_for(resource)
  #   admin_path
  # end
  layout 'admin'
  before_action :authenticate_admin!
end
 

