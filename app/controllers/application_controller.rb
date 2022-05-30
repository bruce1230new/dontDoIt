class ApplicationController < ActionController::Base
    def test
        render html: 'Test deploy production'
    end
end
