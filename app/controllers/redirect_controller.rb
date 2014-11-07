class RedirectController < ApplicationController

  def redirect
    redirect_to "/##{request.path}"
  end

end