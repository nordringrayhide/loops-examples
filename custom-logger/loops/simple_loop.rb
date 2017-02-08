class SimpleLoop < Loops::Base
  config_option :period, type: Integer, default: 0
  def run
    with_period_of(period) do
      info 'Tick Tack[]'
    end
  end
end
