require 'msip/application_controller'
class ApplicationController < Msip::ApplicationController
  protect_from_forgery with: :exception
end

