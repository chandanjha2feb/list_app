class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

    # GET /lists
    def index
      @lists = List.where(status: true)

      #render json: @lists
    end

    # GET /lists/1
    def show
      @list = List.find(params[:id])
    #render json: @list
    end

    # POST /lists
    def create
      @list = List.new(list_params)

      if @list.save
        redirect_to lists_path
        #render json: @list, status: :created
      else
        render :new, json: @list.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /lists/1
    def update
      if @list.update(list_params)
        redirect_to list_path(@list)
        #render json: @list
      else
        render :edit
        # render json: @list.errors, status: :unprocessable_entity
      end
    end

    # DELETE /lists/1
    def destroy
      @list.destroy
      if @list.destroy
        redirect_to lists_path
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @list = List.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_params
        params.require(:list).permit(:name, :description)
      end
end
