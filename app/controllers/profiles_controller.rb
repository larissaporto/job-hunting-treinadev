class ProfilesController < ApplicationController
    before_action :authenticate_applicant! 
    before_action :get_profile
    
    def new
        @profile = current.applicant.build_profile
    end

    def create
        
    end

    def show
        @profile = get_profile    
    end

    private

    def get_profile
        @profile = current_applicant.profile
    end
        
end