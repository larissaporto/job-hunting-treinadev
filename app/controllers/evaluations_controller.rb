class EvaluationsController < ApplicationController
      
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
end