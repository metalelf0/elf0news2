namespace :top_stories do
  desc "List top stories from HN with user info"
  task list: :environment do
    service = Services::TopStories.new
    puts "Please wait while fetching top news..."
    service.top_stories(15).each do |story|
      # y story
      presenter = Services::StoryPresenter.new(story)
      puts "Title:                         #{presenter.story_title}"
      puts "Submitted by:                  #{presenter.author_id}"
      puts "HN user karma:                 #{presenter.hn_user_karma}"
      puts "HN user submissions count:     #{presenter.hn_user_submissions_count}"
      puts "Is on StackOverflow?           #{presenter.is_on_stack_overflow?}"
      puts "StackOverflow user reputation: #{presenter.stack_overflow_reputation}"
      puts "Is on Twitter?                 #{presenter.is_on_twitter?}"
      puts "Twitter tweets count:          #{presenter.twitter_tweets_count}"
      puts "\n===================================================================================\n"
    end
  end

end
