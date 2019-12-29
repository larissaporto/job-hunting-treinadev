class CommentsController < ApplicationController
    before_action :authenticate_headhunter!, only: [:create]
    before_action :authorize_headhunter, only: [:create]
    
    def create
        @profile = Profile.find(params[:profile_id])
        @comment = @profile.comments.create(comment_params)
        if @comment.persisted?
            flash[:notice] = 'Comentário adicionado com sucesso'
            redirect_to profile_path(@profile)
        else
            flash[:alert] = 'Erro'
        end
    end

    private

    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
    def authorize_headhunter
        redirect_to root_path unless current_headhunter
    end
end