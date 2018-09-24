# frozen_string_literal: true

require 'spec/spec_helper'

RSpec.describe 'bin/cron_parser' do
  context 'when valid parameters are passed' do
    it 'displays the cron table' do
      expect(`bin/cron_parser "*/15,2,20-30 0 1,15 * 1-5" "some_command"`).to eq(
"----------------------------------------------------------------
|  Minute:          |  0 2 15 20 21 22 23 24 25 26 27 28 29 30 45 |
|  Hour:            |  0                                          |
|  Day              |  1 15                                       |
|  Month            |  1 2 3 4 5 6 7 8 9 10 11                    |
|  Days of the week |  1 2 3 4 5                                  |
|  Command:         |  some_command                               |
----------------------------------------------------------------
")
    end
    it 'exists with 0 status code'
  end

  context 'when invalid parameters are passed' do
    it 'displays tutorial on how to use the script'
    it 'exists with 1 status code'
  end
end
