class ProfilesController < ApplicationController
    before_action :authenticate_applicant!, only:[:new, :create, :edit, :update] 
    before_action :get_profile
    
    def new
    end

    def create
        @profile = current_applicant.build_profile(profile_params)
        if @profile.save
            flash[:notice] = 'Perfil salvo'
            redirect_to @profile
        else
            flash[:alert] = "Erro"
            render :new
  end
    end

    def show
    end

    def edit
    end

    def update
    end


    private

    def get_profile
        @profile = current_applicant.profile || current_applicant.build_profile
    end

    def profile_params
        params.require(:profile).permit(:name, :social_name, :description, :qualification, 
                                        :birth_date, :applicant_id, :photo)
    end
        
end