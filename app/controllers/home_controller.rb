class HomeController < ApplicationController
    skip_before_action :require_login, only: %i[top]    
    def top
        @logs = User.fetch_user_data
    end
end
