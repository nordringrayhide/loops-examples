# https://devcenter.heroku.com/articles/forked-pg-connections
# https://docs.newrelic.com/docs/agents/ruby-agent/background-jobs/monitor-ruby-background-processes
class SimpleLoop < Loops::Base
  def run
    info 'after fork'
    # ActiveRecord::Base.establish_connection
    # require 'newrelic_rpm'
    with_period_of(5) do
      begin
        info 'Tick Tack'
      ensure
        info 'before fork'
        # ActiveRecord::Base.connection.disconnect!
        # ::NewRelic::Agent.shutdown
        exit(0)
      end
    end
  end
end
