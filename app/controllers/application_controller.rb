class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
        if resource.class == Applicant
          if current_applicant.profile.incomplete?
            edit_profile_path(current_applicant.profile)
          else
            root_path
          end  
        else
          root_path
        end 
      end
    
end
