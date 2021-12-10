class Api::V1::GraphitiController < ApplicationController
  skip_before_action :authenticate_business_account!

  include Graphiti::Rails::Responders
end
