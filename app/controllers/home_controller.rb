# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    redirect_to user_index_path if user_signed_in?
  end
end
