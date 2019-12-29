class AppliesController < ApplicationController
    before_action :authenticate_applicant!, only: [:edit, :update]
    before_action :authorize_applicant, only: [:edit, :update]

    before_action :authenticate_headhunter!, only: [:star, :deny, :allow]
    before_action :authorize_headhunter, only: [:star, :deny, :allow]

    def edit
        @apply = Apply.find(params[:id])      
    end
    def update
        @apply = Apply.find(params[:id])
        if @apply.update!(params.require(:apply).permit(:cover_letter, :job_id, :profile_id))
            flash[:notice] = 'Incrição efetuada com sucesso'
            redirect_to job_path(@apply.job_id)
        else
            flash[:alert] = "Erro"
            render :update
        end
    end
    
    def star
        @apply = Apply.find(params[:id])
        if @apply.unstarred?
            @apply.starred!
        else
            @apply.unstarred!
        end
        redirect_to candidates_job_path(@apply.job_id) 
    end

    def deny
        @apply = Apply.find(params[:id])
        @apply.rejected!

        @feedback = @apply.create_feedback
        redirect_to edit_feedback_path(@feedback)
    end
  
    def allow
        @apply = Apply.find(params[:id])
        @apply.accepted!

        @proposal = @apply.create_proposal
        redirect_to edit_proposal_path(@proposal)
    end

    private

    def authorize_applicant
        redirect_to root_path unless current_applicant
    end
    def authorize_headhunter
        redirect_to root_path unless current_headhunter
    end
end