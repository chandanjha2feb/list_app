class TrashController < ApplicationController
  def index
    @trash = List.where(status: false)
  end
end
