class VisitorsController < ApplicationController
	
	def new
		@owner = Owner.new
		flash.now[:notice] = 'Welcome! Bienvenidos a Miami!!!'
		flash.now[:alert] = 'My birthday is soon..ish!'
	end
	
end