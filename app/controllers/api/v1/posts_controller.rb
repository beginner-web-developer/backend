class Api::V1::PostsController < ApplicationController
    # GET ALL POSTS FROM DB
    def index
        @post = Post.all
        render json: @post, status: 200
    end

    # POST REQUEST TO DB FOR POST CREATION
    def create
        @post = Post.new(post_params)
        if @post.save
            render json:{
                data: @post,
                status: "success"
            }
        else
            render json: {
                error: @post.errors.full_messages[0],
                status: "failure"
            }
        end
    end

    # DELETE REQUEST TO SERVER TO DELETE POST
    def destroy
        @post = Post.find_by(id: params[:id])
        if @post
            @post.destroy
            render json: {
                message: "Post successfully deleted."
            }
        else 
            render json: {
                error: "Error: Unable to delete post."
            }
        end
    end

    private
    def post_params
        params.require(:post).permit(:user_id, :title)
    end
end
