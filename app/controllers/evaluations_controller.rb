class EvaluationsController < ApplicationController
    before_action :authenticate_applicant!, only: [:create]
    before_action :authorize_applicant, only: [:create]     

    def create 
        @proposal = Proposal.find(params[:proposal_id])
        @evaluation = @proposal.evaluations.create(evaluation_params)
        if @evaluation.persisted?
            flash[:notice] = 'Feedback adicionado com sucesso'
            redirect_to proposal_path(@proposal)
        else
            flash[:alert] = 'Erro'
        end
    end

    private

    def evaluation_params
      params.require(:evaluation).permit(:body)
    end
    
    def authorize_applicant
        redirect_to root_path unless current_applicant
    end
end