class ToDosController < ApplicationController

    before_action :find_to_do, only: [:update, :destroy]

    def index
        @todos = ToDo.all

        render json: @todos
    end

    def create
        @to_do = ToDo.create(
            title: params[:title],
            content: params[:content],
            urgent: params[:urgent],
            done: params[:done]
        )

        render json: @to_do, status: :created
    end

    def update

    end

    def destroy
        @to_do.destroy
        render status: :no_content
    end

    private

    def find_to_do
        ToDo.find(params[:id])
    end

end
