# Fake data only. Safe to run again: it clears and reloads the books.
Book.delete_all
[
  ["The Left Hand of Darkness", "Ursula K. Le Guin", "Science fiction", 5, 1969],
  ["Kindred", "Octavia E. Butler", "Science fiction", 5, 1979],
  ["The Remains of the Day", "Kazuo Ishiguro", "Literary fiction", 4, 1989],
  ["Thinking, Fast and Slow", "Daniel Kahneman", "Non-fiction", 4, 2011],
  ["The Name of the Rose", "Umberto Eco", "Mystery", 4, 1980],
  ["Station Eleven", "Emily St. John Mandel", "Literary fiction", 3, 2014]
].each do |title, author, genre, rating, year|
  Book.create!(title:, author:, genre:, rating:, published_year: year)
end
puts "Seeded #{Book.count} books"
