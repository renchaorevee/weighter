class DashboardController < ApplicationController
	def index
    @records = current_user.records
    @data = @records.sort {|x,y|
        x.date <=> y .date
      }.map { |record|
      [record.date.to_time.to_i * 1000, record.weight.to_f]
    }
	end
end
