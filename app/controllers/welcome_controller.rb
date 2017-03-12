class WelcomeController < ApplicationController
  def index
    flash[:warning] = "这是warining讯息！"
  end
end
