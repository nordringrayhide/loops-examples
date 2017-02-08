class BlankLoop < Loops::Base
  def run
    with_period_of(10) do
      info 'do nothing'
    end
  end
end
