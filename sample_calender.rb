require 'date'

def calendar_month(year: Date.today.year, month: Date.today.month)

  firstday = Date.new(year, month, 1)
  lastday = Date.new(year, month, -1)

  first_wday = firstday.wday
  lastday_date = lastday.day

  days = (1..lastday_date).map{ |n| n.to_s.rjust(2)}

  days = Array.new(first_wday, '  ').push(days).flatten.each_slice(7).to_a

  puts firstday.strftime("%B %Y").center(20)
  puts %w[Su Mo Tu We Th Fr Sa].join(' ')

  days.each do |week|
    puts week.join(' ')
  end
end

def calendar(year: Date.today.year)
  puts '-' * 20
  (1..12).each do |n|
    calendar_month(year: year, month: n)
    puts '-' * 20
  end
end

calendar