class Simple0Loop < Loops::Base
  def run
    info 'after fork'
    with_period_of(50) do
      begin
        info 'Tick Tack'
        ::NewRelic::Agent.record_custom_event('Clockwork666', message: 'Tick Tack', time: Time.now.utc.to_i)
      ensure
        exit(0)
      end
    end
  end
end
