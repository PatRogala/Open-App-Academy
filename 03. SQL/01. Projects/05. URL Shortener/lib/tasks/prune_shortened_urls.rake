namespace :url_shorter do
  task prune_shortened_urls: :environment do
    puts 'Pruning shortened urls...'
    initial_count = ShortenedUrl.count
    ShortenedUrl.prune(5)
    puts "Done. #{initial_count - ShortenedUrl.count} shortened urls pruned."
  end
end
