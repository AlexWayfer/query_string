# frozen_string_literal: true

require 'bundler'
Bundler.require

describe QueryString do
  describe '.build' do
    subject(:result) { described_class.build(input) }

    context 'when input is empty Hash' do
      let(:input) { {} }

      it { is_expected.to eq '' }
    end

    context 'when input is nil' do
      let(:input) { nil }

      it { is_expected.to eq '' }
    end

    context 'when input is String' do
      let(:input) { 'foo=bar' }

      it do
        expect { result }.to raise_error(ArgumentError, 'value must be a Hash')
      end
    end

    context 'when input is one-level Hash' do
      let(:input) { { a: 1, b: 'c', d: :e, f: 2.34 } }

      it { is_expected.to eq 'a=1&b=c&d=e&f=2.34' }
    end

    context 'when input is nested Hashes' do
      let(:input) { { a: { b: 'c', d: 'e' }, f: 'g' } }

      it { is_expected.to eq 'a[b]=c&a[d]=e&f=g' }
    end

    context 'when input is Hash with Array' do
      let(:input) { { a: %w[foo bar] } }

      it { is_expected.to eq 'a[]=foo&a[]=bar' }
    end

    context 'when input is Hash with Array of Hashes' do
      let(:input) { { a: [{ b: 'c', d: 'e' }, { b: 'g' }] } }

      it { is_expected.to eq 'a[][b]=c&a[][d]=e&a[][b]=g' }
    end

    context 'when input is Hash with unencoded keys and values' do
      let(:input) { { 'test field' => { 'another weird' => 'foo/(bar)' } } }

      it { is_expected.to eq 'test+field[another+weird]=foo%2F%28bar%29' }
    end

    context 'when input is Hash with nil value' do
      let(:input) { { a: nil, b: '', d: nil } }

      it { is_expected.to eq 'a&b=&d' }
    end

    context 'when input is Hash with nil in Array value' do
      let(:input) { { a: [nil] } }

      it { is_expected.to eq 'a[]' }
    end

    context 'when input is Hash with empty String in Array value' do
      let(:input) { { a: [''] } }

      it { is_expected.to eq 'a[]=' }
    end

    context 'when input is Hash with only empty Hash value' do
      let(:input) { { a: {} } }

      it { is_expected.to eq '' }
    end

    context 'when input is Hash with only empty Array value' do
      let(:input) { { a: [] } }

      it { is_expected.to eq '' }
    end

    context 'when input is Hash with empty Hash value' do
      let(:input) { { a: 'b', c: {} } }

      it { is_expected.to eq 'a=b' }
    end

    context 'when input is Hash with empty Array value' do
      let(:input) { { a: 'b', c: [] } }

      it { is_expected.to eq 'a=b' }
    end
  end
end
