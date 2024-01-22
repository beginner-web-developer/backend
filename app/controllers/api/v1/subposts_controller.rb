class Api::V1::SubpostsController < ApplicationController
    def index
        @subpost = Subpost.all
        render json: @subpost
    end

    def create
        @subpost = Subpost.new(subposts_params)
        if @subpost.save
            render json: {
                data: @subpost,
                status: "success"
            }
        else
            render json: {
                error: @subpost.errors.full_messages[0],
                status: "failure"
            }
        end
    end

    def destroy
        @subpost = Subpost.find(params[:id])
        if @subpost
            @subpost.destroy
            render json: {
                message: "Subposts are deleted"
            }
        else
            render json: {
                error: "Error: Couldnt delete subposts"
            }
        end
    end

    def update
        @subpost = Subpost.find(params[:id])
        if @subpost
            @subpost.update(subposts_params)
            render json: {
                data: @subpost,
                status: "success"
            }
        else
            render json: {
                error: @subpost.errors.full_messages[0],
                status: "failure"
            }
        end
    end
        
    private
    def subposts_params
        params.require(:subpost).permit(:user_id, :post_id, :body)
    end
end
