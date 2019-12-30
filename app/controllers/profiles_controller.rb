class ProfilesController < ApplicationController
    before_action :authenticate_applicant!, only:[:edit, :update, 
                                                :my_jobs, :my_proposals]
    before_action :authenticate_applicant!, only: [:edit, :update,
                                                :my_jobs, :my_proposals]
    before_action :get_profile

    def show
    end

    def edit
        
    end

    def update
        if @profile.update!(profile_params)
            @profile.done! unless @profile.done?
            flash[:notice] = 'Perfil salvo'
            redirect_to @profile
        else
            flash[:alert] = "Erro"
            render :update
        end
    end

    def my_jobs
        @applies = @profile.applies
    end

    def my_proposals
        @applies = @profile.applies
    end


    private

    def get_profile
        if current_applicant
            @profile = Profile.find(params[:id]) || @profile = current_applicant.profile
        elsif current_headhunter
            @profile = Profile.find(params[:id])
        end
    end

    def profile_params
        params.require(:profile).permit(:name, :social_name, :description, :qualification, 
                                        :birth_date, :applicant_id, :photo, :experience)
    end

    def authorize_applicant
        redirect_to root_path unless current_applicant
    end    
end