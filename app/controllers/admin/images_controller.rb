class ImagesController < ApplicationController
  before_filter :admin_only
end
