# frozen_string_literal: true

require 'lib/expander'
require 'lib/presenter'

class CronParser
  def initialize(argv, stdout, stderr)
    @argv = argv
    @stdout = stdout
    @stderr = stderr
  end

  def call
    repeat_config, command = argv
    repetitions = Expander.new(repeat_config).call
    stdout.puts(Presenter.call(repetitions, command))
    0
  rescue StandardError => e
    stderr.puts(e.message)
    stderr.puts(e.backtrace)
    1
  end

  private

  attr_reader :argv, :stdout, :stderr
end
