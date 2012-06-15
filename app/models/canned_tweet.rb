class CannedTweet < ActiveRecord::Base
  ENTER_TYPE = 'enter'
  EXIT_TYPE = 'exit'
  
  validates :tweet_type, inclusion: [ENTER_TYPE, EXIT_TYPE]
  
  scope :enter_tweets, where('tweet_type = ?', ENTER_TYPE)
  scope :exit_tweets, where('tweet_type = ?', EXIT_TYPE)
end