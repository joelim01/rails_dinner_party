class ReservationsController < ApplicationController
  before_filter :admin_only
end
