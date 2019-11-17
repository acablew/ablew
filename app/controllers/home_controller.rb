class HomeController < ApplicationController
    layout "homelayout"
    def index
        @scholarships = Scholarship.all
        @posts = Post.all
        i=0
        count_name = State.all
        for scholarship in @scholarships do

            # count_name[i] = scholarship.state.name
            i = i+1
        end
        @country_name = count_name.uniq
        @subjects = Subject.all
    end
end
