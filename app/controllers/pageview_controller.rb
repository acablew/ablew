class PageviewController < ApplicationController
    layout "homelayout"
    def shown
        @page_id = params[:page]
        @page = Page.find(@page_id)
    end
end
