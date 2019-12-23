class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
        if resource.class == Applicant
          edit_profile_path(current_applicant.profile) unless current_applicant.profile.done? 
        else
          root_path
        end 
      end
    
end
