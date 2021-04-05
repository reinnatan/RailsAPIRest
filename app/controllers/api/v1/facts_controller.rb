class Api::V1::FactsController < ApplicationController
    def index
       @fact = Fact.all
       render json: @fact
    end

    def show
        @fact = Fact.where("id=? AND user_id=?", params[:id], params[:user_id])
        render json: @fact
    end

    def update
       @fact = Fact.find(params[:id])
       @fact.user_id = params[:user_id]
       @fact.likes = params[:likes]
       @fact.fact = params[:fact] 
            if @fact.save
                #@fact.update(fact_params)
                render json: {message: 'Fact successfully updated.'}, status: 200
            else
                render json: {error: 'Unable to update fact.'}, status: 400 
            end
        rescue ActiveRecord::RecordNotFound
            render json: {error: 'Unable to find fact with id '+params[:id]}, status: 400 
    end

    def destroy
            @fact = Fact.find(params[:id])
            @fact.destroy
            render json: { message: 'Fact Successfully delete'}, status: 200
        rescue ActiveRecord::RecordNotFound
            render json: {error:'Unable to delete Fact.' }, status: 400
        
    end
    

    private
    def find_fact
        @fact = Fact.where("id=? AND user_id=?", 10, params[:user_id])
    end

    def fact_params
        params.require(:fact).permit(:likes, :user_id, :id)
    end
end
