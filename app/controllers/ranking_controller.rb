class RankingController < ApplicationController
  before_action :ranking
  def ranking
    impressionable_ids = Impression.group(:impressionable_id).order('count_impressionable_id DESC').limit(5).count(:impressionable_id).keys
    @ranking = impressionable_ids.map{|id| Content.find(id)}
  end
end
