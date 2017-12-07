require "redis-queue"

module Loops
  class RedisQueue < Base
    def process_message(message); raise "It's not implemented yet"; end

    def run
      redis = Redis.new
      queue = Redis::Queue.new('q_test','bp_q_test',  :redis => redis)

      setup_signals


      queue.process do |message|
        process_message(message)
      end
    end

    private

    def disconnect_client_and_exit
      debug "Unsubscribing..."
      # ...
      exit(0)
    end

    def setup_signals
      Signal.trap('INT') { disconnect_client_and_exit }
      Signal.trap('TERM') { disconnect_client_and_exit }
    end
  end
end

