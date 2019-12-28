class FeedbacksController < ApplicationController
    def edit
        @feedback = Feedback.find(params[:id])
        @apply = @feedback.apply
    end
    def update
        @feedback = Feedback.find(params[:id])
    
        @job = @feedback.apply.job
        if @feedback = Feedback.update(params.require(:feedback).permit(:body, :apply))
            flash[:notice] = 'Feedback criado com sucesso'
            redirect_to candidates_job_path(@job)
        else
            render :edit
        end
    end

end