class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    Pagy::DEFAULT[:items] = 3 # items per page
end
