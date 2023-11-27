class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render json: Cat.all
    end

    def show
        @cat = Cat.find_by(params[:id])
        render json: @cat
    end

    def update
        @cat = Cat.find_by(params[:id])

        if @cat.update(cat_params)
            redirect_to cat_url(@cat)
        else
            render json: cat.errors.full_messages, status: 422
        end
    end

    def new
        @cat = Cat.new
        render json: @cat
    end


    def create
        @cat = Cat.new(cat_params)

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render json: cat.errors.full_messages, status: 422
        end
    end

    def edit
        @cat = Cat.find_by(params[:id])
        render json: @cat
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex)
    end


end

