require 'bundler'
Bundler.require

describe QueryString do
  describe '.build' do
    subject { described_class.build(input) }

    context 'input is empty Hash' do
      let(:input) { {} }

      it { is_expected.to eq '' }
    end

    context 'input is nil' do
      let(:input) { nil }

      it { is_expected.to eq '' }
    end

    context 'input is one-level Hash' do
      let(:input) { { a: 1, b: 'c', d: :e, f: 2.34 } }

      it { is_expected.to eq 'a=1&b=c&d=e&f=2.34' }
    end

    context 'input is nested Hashes' do
      let(:input) { { a: { b: 'c', d: 'e' }, f: 'g' } }

      it { is_expected.to eq 'a[b]=c&a[d]=e&f=g' }
    end

    context 'input is Hash with Array' do
      let(:input) { { a: %w[foo bar] } }

      it { is_expected.to eq 'a[]=foo&a[]=bar' }
    end

    context 'input is Hash with Array of Hashes' do
      let(:input) { { a: [{ b: 'c', d: 'e' }, { b: 'g' }] } }

      it { is_expected.to eq 'a[][b]=c&a[][d]=e&a[][b]=g' }
    end
  end
end
