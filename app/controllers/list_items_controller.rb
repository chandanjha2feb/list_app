class ListItemsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy, :new, :create, :edit]

    def index
      @list_items = ListItem.where(status: true)
    end

    def show
      @list_item = ListItem.find(params[:id])
    end

    def edit
      @list_item = ListItem.find(params[:id])
    end

    def new
      @list_item =ListItem.new(:list=>@list)
    end

    def create
      @list_item = @list.list_items.new(list_item_params)
      respond_to do |format|
      if @list_item.save
        format.html { redirect_to lists_path, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: list_item }
      else
        format.html { render :new }
        format.json { render json: @list_item.errors, status: :unprocessable_entity }
      end
    end
    end

    def update
      @list_item = ListItem.find_by(:id=>params[:id])
      if @list_item.update(list_item_params)
        redirect_to list_list_item_path(@list_item)
      else
        render json: @list_item.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @list_item= ListItem.find_by(id: params[:id])
      @list_item.destroy
      if @list_item.destroy
        redirect_to lists_path
      else
        render json: @list_item.errors, status: :unprocessable_entity
      end
    end

    def vanish
      SoftDelete.vanish(params)
      redirect_to lists_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @list = List.find(params[:list_id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_item_params
        params.require(:list_item).permit(:name, :description, :status)
      end
end
