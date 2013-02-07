env = ENV["RAILS_ENV"] || "production"

worker_processes 4

listen "/tmp/staffwisey.socket", :backlog => 64

preload_app true

timeout 30

pid "/tmp/pids/unicorn.staffwisely.pid"

if env == "production"
  working_directory "/home/deploy/apps/staffwisely_v2/current"

  user "deploy", "staff"
  shared_path = "/home/deploy/apps/staffwisely_v2/shared"

  stderr_path "#{shared_path}/log/unicorn.stderr.log"
  stdout_path "#{shared_path}/log/unicorn.stdout.log"
end

before_fork do |server, worker|
  if defined(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "/tmp/pids/unicorn.staffwisely.pid.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # THEN WHO WAS PHONE??!
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
