class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  private

  def basic_authentication!
    name = 'ezuka'
    passwd = '026c1efca54191179a33e2f7aa62649991a38ff5'
    authenticate_or_request_with_http_basic('BA') do |n, p|
      n == name && Digest::SHA1.hexdigest(p) == passwd
    end
  end
end
