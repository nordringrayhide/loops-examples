class SimpleLoop < Loops::RedisQueue
  def process_message(message)
    info "Received a message: #{message}"
    info "sleeping..."
    sleep(0.5 + rand(10) / 10.0) # do something "useful" with the message :-)
    info "done..."
  end
end
