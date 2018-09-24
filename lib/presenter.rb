# frozen_string_literal: true

require 'terminal-table'

class Presenter
  class << self
    def call(repeat_config, command)
      content = content(repeat_config, command)
      Terminal::Table.new do
        self.rows = content
        self.style = { padding_left: 2, border_x: '-', border_i: '' }
      end
    end

    private

    def content(repeat_config, command)
      [
        ['Minute:', present_array(repeat_config.fetch(:minutes))],
        ['Hour:', present_array(repeat_config.fetch(:hours))],
        ['Day', present_array(repeat_config.fetch(:days_of_month))],
        ['Month', present_array(repeat_config.fetch(:months))],
        ['Days of the week', present_array(repeat_config.fetch(:days_of_week))],
        ['Command:', command]
      ]
    end

    def present_array(value)
      value.join(' ')
    end
  end
end
