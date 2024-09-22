class SearchController < ApplicationController
  # curl --header "content-type: application/json" --request GET --data '{"query":"deep"}'  http://127.0.0.1:3000/search
  def search
    @results = Message.search(params[:query]).recoreds

    render json: @results
  end
end
