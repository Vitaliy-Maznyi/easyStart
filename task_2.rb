require 'date'

module DatePerformer
  FORMAT = "%d-%m-%Y %H:%M" # input date format

  def self.step(date)
    counter = [4, 8, 7, 4] # number of iterations for specific step
    step = [15, 30, 60, 1440] # minutes in step. 15 minutes in first step, 30 in second, etc.
    output = []
    (0..3).each do |i|
      counter[i].times do
        date = date + Rational(step[i], 1440)
        output.push(date.strftime("%a, %d %b %Y %H:%M:%S"))
      end
    end
    output.each { |el| p el} # array of dates
  end
end

puts 'Enter your date in 25-10-2001 18:30 format'
date_time = gets.chomp
date_time << ' 00:00' if DateTime.parse(date_time).hour.zero? # if input is only date without time
date = DateTime.strptime(date_time, DatePerformer::FORMAT)
DatePerformer.step(date)
