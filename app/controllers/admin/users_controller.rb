class UsersController < ApplicationController
  before_filter :admin_only
end
