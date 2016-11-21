module StringFormatter
  def self.plural(n, singular)
    if n == 1
      "1 #{singular}"
    else
      "#{n} #{singular}s"
    end
  end
end

module TimeFormatter
  def self.format_time(subtraction)  # format timestamp in human time representation
    seconds = subtraction % 60
    minutes = (subtraction / 60) % 60
    hours = (subtraction/3600) % 24
    days = (subtraction / 86400)
    d = StringFormatter.plural(days, 'day')
    h = StringFormatter.plural(hours, 'hour')
    m = StringFormatter.plural(minutes, 'minute')
    s = StringFormatter.plural(seconds, 'second')
    if seconds.nonzero?
      puts "#{d} #{h} #{m} and #{s}"
    else
      puts "#{d} #{h} #{m}"
    end
  end
end

puts 'Enter first timestamp:'
first = gets.chomp.to_i
puts 'Enter second timestamp:'
second = gets.chomp.to_i
first, second = second, first if first > second
subtraction = second - first

puts TimeFormatter.format_time(subtraction)