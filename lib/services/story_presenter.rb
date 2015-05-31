class Services::StoryPresenter

  attr_accessor :story

  def initialize(story)
    @story = story
  end

  def story_title
    story['story']['title']
  end

  def story_uri
    story['story']['url']
  end

  def author_id
    story['story']['by']
  end

  def hn_user_karma
    story['user']['hacker_news']['karma']
  end

  def hn_user_submissions_count
    (story['user']['hacker_news']['submitted'] || []).size
  end

  def is_on_stack_overflow?
    story['user']['stack_overflow'].present?
  end

  def stack_overflow_reputation
    if is_on_stack_overflow?
      story['user']['stack_overflow']['reputation']
    else
      "n/a"
    end
  end

  def is_on_twitter?
    story['user']['twitter'].present?
  end

  def twitter_tweets_count
    if is_on_twitter?
      story['user']['twitter']['statuses_count']
    else
      "n/a"
    end
  end

end
