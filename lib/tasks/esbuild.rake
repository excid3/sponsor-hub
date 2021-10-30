# frozen_string_literal: true
namespace :esbuild do
  command = 'esbuild'
  max_output_line_len = 256
  pids_command = %(ps -C#{command} -o"pid=")
  show_ps_command = %(ps -fC#{command} | cut -c -#{max_output_line_len})

  desc 'shows running esbuild processes'
  task show: :environment do
    puts 'Showing running esbuild processes'
    pids = `#{pids_command}`
    if pids.empty?
      puts '*** No esbuild process found'
    else
      puts `#{show_ps_command}`
    end
  end

  desc 'kills (sends HUP signal) to running esbuild processes'
  task kill: :environment do
    puts 'Killing running esbuild processes'
    pids = `#{pids_command}`
    if pids.empty?
      puts '*** No esbuild process found'
    else
      kill_pids(pids.split("\n"))
    end
  end

  desc 'show help message for tasks in the esbuild namespace'
  task help: :environment do
    puts help_message
  end

  private

  def kill_pids(pids)
    killed_count = 0
    error_pids = []
    puts "Found #{pids.length} running..."
    pids.each do |pid|
      pid.strip!
      kill_command = "kill -HUP #{pid}"
      puts kill_command
      `#{kill_command}`
      $CHILD_STATUS.success? ? killed_count += 1 : error_pids << pid
    end

    puts "Successfully killed #{killed_count}."
    puts "Error killing #{error_pids.length} process PIDs: #{error_pids}" if error_pids.length.positive?
  end

  def help_message
    <<-HELP

      * Tested on Ubuntu 20.04 LTS only

      Sometimes, in the course of Rails 7 development, esbuild processes from
      invocation of the "bin/dev" command will not get cleaned up when the
      app is exited or crashes.

      This task will show you what esbuild processes are running and allow
      you to kill them.

      esbuild:show: Looks for running esbuild processes
      esbuild:kill: Looks for running esbuild processes and kills them

    HELP
  end
end

