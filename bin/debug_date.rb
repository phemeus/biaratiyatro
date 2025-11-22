id = "-Oeg2hQlIuzJ9aBN7TiY"
play = Play.find(id)

puts "--- Debug Info ---"
puts "I18n.locale: #{I18n.locale}"
puts "I18n.default_locale: #{I18n.default_locale}"

if play
  puts "Play found: #{play.title}"
  puts "Date value: #{play.date.inspect}"
  puts "Date class: #{play.date.class}"
  
  if play.date.is_a?(Time) || play.date.is_a?(Date) || play.date.is_a?(DateTime)
    puts "Localized (long): #{I18n.l(play.date, format: :long)}"
  else
    puts "Date is not a Time/Date object, it is a #{play.date.class}"
  end
else
  puts "Play with id #{id} not found."
end
