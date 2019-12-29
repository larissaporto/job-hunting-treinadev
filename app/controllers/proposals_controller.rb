class ProposalsController < ApplicationController
    def edit
        @proposal = Proposal.find(params[:id])
        @apply = @proposal.apply
    end

    def update
        @proposal = Proposal.find(params[:id])
    
        if @proposal = Proposal.update(params.require(:proposal).permit(:position, :apply, :start_date, 
                                                                        :job_details, :salary, :bonus,
                                                                        :benefits, :addicional_info))
            flash[:notice] = 'Proposta criado com sucesso'
            redirect_to proposal_path(@proposal)
        else
            render :edit
        end
    end
    def show
        @proposal = Proposal.find(params[:id])
    end
end