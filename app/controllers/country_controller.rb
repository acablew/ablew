class CountryController < ApplicationController
    layout "homelayout"
    def index
      if params[:country].present?
        set_meta_tags title: params[:country].gsub("-", " ")
      end
        @posts = Post.all
        # @country = Subject.find(params[:country])
        @country = params[:country]
        params[:country]["Scholarships-in-"] = ""
        if params[:country].to_s.split('-').count > 1
            params[:country]["-"] = " "
        end
        @educations = Education.all
        @subjects = Subject.all

        i=0
        @real_scholarships = Array.new
        @scholorships = Scholarship.all
        for scholorship in @scholorships
            for state in scholorship.states
                if(state.name === params[:country])
                    @real_scholarships[i] = scholorship
                    i=i+1
                end
            end
        end
        # byebug
    end
end
