# https://devcenter.heroku.com/articles/forked-pg-connections
# https://docs.newrelic.com/docs/agents/ruby-agent/background-jobs/monitor-ruby-background-processes
class SimpleLoop < Loops::Base
  def run
    info 'after fork'
    # ActiveRecord::Base.establish_connection
    #
    #::NewRelic::Agent.after_fork {
    #require 'newrelic_rpm'
    #}
    with_period_of(50) do
      begin
        info 'Tick Tack'
        ::NewRelic::Agent.record_custom_event('Clockwork777', message: 'Tick Tack', time: Time.now.utc.to_i)
      ensure
        info 'before fork'
        # ActiveRecord::Base.connection.disconnect!
        #::NewRelic::Agent.shutdown
        exit(0)
      end
    end
  end
end
