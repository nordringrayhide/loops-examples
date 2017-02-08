class CustomLogger < ::Loops::Logger
  # Proxy logger calls to our logger
  [ :debug, :info, :warn, :error, :fatal ].each do |meth_name|
    class_eval <<-EVAL, __FILE__, __LINE__ + 1
      def #{meth_name}(message)
        super
        IO.write('debug.txt', "#\{message\}\n", mode: 'a')
        # Honeybadger
        # NewRelick
        # Whatever
        # ...
        # RabbitMQ || RedisMQ + Loops to send anywhere asynchronously
      end
    EVAL
  end
end

Loops.logger = CustomLogger.new(STDOUT)
