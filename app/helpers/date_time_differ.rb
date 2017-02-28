module DateTimeDiffer

	def date_time_between(date_time_a, date_time_b)

		seconds = ((date_time_a - date_time_b)*24*60*60).to_i
		
		sec = seconds % 60
		minutes = seconds / 60
		min = minutes % 60
		hours = minutes / 60
		hour = hours % 24
		days = hours / 24

		days.to_s + ' days, ' + hour.to_s + ' hours, '+ min.to_s + ' minutes, ' + sec.to_s + ' seconds'
	end
end