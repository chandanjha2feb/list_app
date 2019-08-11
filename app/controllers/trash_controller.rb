class TrashController < ApplicationController
  def index
    @trash = List.where(status: false)
    @trash_list_items = ListItem.where(status:false)
  end
end
