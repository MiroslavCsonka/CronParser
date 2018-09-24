# frozen_string_literal: true

require 'spec/spec_helper'

require 'lib/expander'

RSpec.describe Expander do
  describe '#call' do
    context 'when expanding minutes' do
      subject(:expand_minutes) { described_class.new(format).call.fetch(:minutes) }

      context 'when every minute' do
        let(:format) { '* * * * *' }

        specify { expect(expand_minutes).to eq((0..59).to_a) }
      end

      context 'when exactly at 29th minute' do
        let(:format) { '29 * * * *' }

        specify { expect(expand_minutes).to eq([29]) }
      end

      context 'when every minute between 10 and 15' do
        let(:format) { '10-15 * * * *' }

        specify { expect(expand_minutes).to eq([10, 11, 12, 13, 14, 15]) }
      end

      context 'when every 20 minutes' do
        let(:format) { '*/20 * * * *' }

        specify { expect(expand_minutes).to eq([0, 20, 40]) }

        context 'and also 15 minutes' do
          let(:format) { '*/20,*/15 * * * *' }

          specify { expect(expand_minutes).to eq([0, 15, 20, 30, 40, 45]) }
        end
      end
    end

    context 'when expanding hours' do
      subject(:expand_hours) { described_class.new(format).call.fetch(:hours) }

      context 'when every hour' do
        let(:format) { '* * * * *' }

        specify { expect(expand_hours).to eq((0...24).to_a) }
      end
    end

    context 'when expanding day of month' do
      subject(:expand_days_of_month) { described_class.new(format).call.fetch(:days_of_month) }

      context 'when every day' do
        let(:format) { '* * * * *' }

        specify { expect(expand_days_of_month).to eq((1...31).to_a) }
      end
    end
  end
end
