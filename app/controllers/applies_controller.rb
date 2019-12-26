class AppliesController < ApplicationController
    before_action :authenticate_applicant!, only: [:edit, :update]
    before_action :authorize_applicant, only: [:edit, :update]

    def edit
        @apply = Apply.find(params[:id])      
    end
    def update
        @apply = Apply.find(params[:id])
        if @apply.update!(params.require(:apply).permit(:cover_letter, :job_id, :profile_id))
            flash[:notice] = 'Incrição efetuada com sucesso'
            redirect_to controller: :jobs, action: :show, to_param => @apply.job_id
        else
            flash[:alert] = "Erro"
            render :update
        end
    end
    
  

    private

    def authorize_applicant
        redirect_to root_path unless current_applicant
    end
end