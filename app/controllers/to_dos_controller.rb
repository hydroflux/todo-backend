class ToDosController < ApplicationController

    before_action :find_to_do, only: [:update, :destroy]

    def index
        @todos = ToDo.all

        render json: @todos, status: :ok
    end

    def create
        @to_do = ToDo.create(to_do_params)

        render json: @to_do, status: :created
    end

    def update
        @to_do.update(to_do_params)

        render json: @to_do, status: :ok
    end

    def destroy
        @to_do.destroy

        render status: :no_content
    end

    private

    def find_to_do
        @to_do = ToDo.find(params[:id])
    end

    def to_do_params
        params.require(:to_do).permit(:id, :title, :content, :urgent, :done)
    end

end
