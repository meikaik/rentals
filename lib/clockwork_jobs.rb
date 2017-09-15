require 'clockwork'
include Clockwork

# Define the jobs
handler do |job|
  if job.eql?('frequent.cleanup_sessions')
    Sessions.cleanup_expired()
  elsif job.eql?('mondays.send_news')
    NewsDispatcher.send_news_to_customers()
  end
end

# Define the schedule
every(1.hour, 'frequent.cleanup_sessions')
every(1.day, 'mondays.send_news', :at => '01:00', :if => lambda { |t| t.wday == 1 })

# To run: clockwork lib/clockwork_jobs.rb
