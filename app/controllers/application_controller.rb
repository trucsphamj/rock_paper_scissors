class ApplicationController < ActionController::Base
  protect_from_forgery
  @defeat = {:rock  => :scissors, :paper => :rock, :scissors => :paper}
  @throws = @defeat.keys
  $results = Hash.new(0)

  before_filter do
    #content_type :html
    @defeat = {:rock  => :scissors, :paper => :rock, :scissors => :paper}
    @throws = @defeat.keys  
    @computer_throw = @throws.sample  
  end
end
