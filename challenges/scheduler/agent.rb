require "socket"
require "json"
require "timeout"

def execute(line)
  command = line["command"].join(" ")
  timeout = line["timeout"]
  output, exit_code  = ""

  obj = {}
  obj["command"] = line["command"]

  start = Time.now
  obj["executed_at"] = start.to_i

  r, w = IO.pipe
  begin
    Timeout::timeout(timeout/1000.0) do
      pid = spawn(command, out: w)
      Process.wait pid
      w.close
      exit_code = $?.exitstatus
      output = r.read
    end
  rescue Timeout::Error
    output = "timeout exceeded"
    exit_code = -1
  end

  obj["exit_code"] = exit_code
  obj["duration_ms"] = (Time.now - start) * 1000

  if exit_code == 0
    obj["output"] = output
  else
    obj["error"] = output
  end

  obj
end

def parse_line(line)
  JSON.parse(line)
end

server = TCPServer.new 3000

loop do
  # open
  scheduler = server.accept
  thread = nil

  while line = scheduler.gets
    if thread.nil?
      thread = Thread.new do
        hash = execute(parse_line(line))
        scheduler.puts JSON.generate(hash)
        scheduler.puts "\n"
      end
    else
      scheduler.puts JSON.generate({error: "cannot allow concurrent executions"})
      scheduler.puts "\n"
    end
  end
end
