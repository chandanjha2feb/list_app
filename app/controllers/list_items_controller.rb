class ListItemsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy, :new, :create, :edit]

    # GET /lists
    def index
      @list_items = ListItem.where(status: true)

      #render json: @lists
    end

    # GET /lists/1
    def show
      @list_item = ListItem.find(params[:id])
    #render json: @list_item
    end

    def edit
      @list_item = ListItem.find(params[:id])
    end

    def new
      @list_item =ListItem.new(:list=>@list)
    end
    # POST /lists
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

    # PATCH/PUT /list_items/1
    def update
      @list_item = ListItem.find_by(:id=>params[:id])
      if @list_item.update(list_item_params)
        redirect_to list_list_item_path(@list_item)
        #render json: @list_item
      else
        render :edit
        # render json: @list_item.errors, status: :unprocessable_entity
      end
    end

    # DELETE /list_items/1
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
      @list_item= ListItem.find_by(id: params[:list_item_id])
      if @list_item.present?
        if params.include?('restore')
          @list_item.status = true
        else
          @list_item.status=false
        end
      end
      @list_item.save
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
