class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy, :edit]
  extend SoftDelete

    def index
      @lists = List.where(status: true)
    end

    def show
    end

    def edit
    end

    def new
      @list = List.new
    end
    # POST /lists
    def create
      @list = List.new(list_params)
      respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'Result was successfully created.' }
        format.json { render :show, status: :created, location: list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
    end

    def update
      if @list.update(list_params)
        redirect_to list_path(@list)
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @list.destroy
      if @list.destroy
        redirect_to lists_path
      else
        render json: @list.errors, status: :unprocessable_entity
      end
    end

    def vanish
      byebug
      SoftDelete.vanish(params)
      redirect_to lists_path
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_list
        @list = List.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def list_params
        params.require(:list).permit(:name, :description, :status)
      end
end
