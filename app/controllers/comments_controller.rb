class CommentsController < ApplicationController
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
end