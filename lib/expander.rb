# frozen_string_literal: true

class Expander
  def initialize(expression)
    @expression = expression
  end

  def call
    minute, hour, day, month, day_of_week = expression.split(' ')
    {
      minutes: expand(minute, from: 0, to: 60),
      hours: expand(hour, from: 0, to: 24),
      days_of_month: expand(day, from: 1, to: 31),
      months: expand(month, from: 1, to: 12),
      days_of_week: expand(day_of_week, from: 0, to: 6)
    }
  end

  private

  def expand(format, from:, to:)
    return (from...to).to_a if format == '*'

    if /,/.match?(format)
      return format.split(',').map { |sub_formats| expand(sub_formats, from: from, to: to) }.flatten.uniq.sort
    end

    nth_format_matches = %r{^*[/](\d+)$}.match(format)
    unless nth_format_matches.to_a.empty?
      nth = nth_format_matches[1].to_i
      return (to / nth).times.map { |index| index * nth }
    end

    between_format_matches = /^(\d+)-(\d+)$/.match(format)
    unless between_format_matches.to_a.empty?
      return (between_format_matches[1].to_i..between_format_matches[2].to_i).to_a
    end

    [format.to_i]
  end

  attr_reader :expression
end
