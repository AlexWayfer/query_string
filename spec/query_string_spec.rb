require 'bundler'
Bundler.require

describe QueryString do
  it 'generates nothing if need be' do
    QueryString.encode({}).should eq ''
    QueryString.encode(nil).should eq ''
  end

  it 'generates a straight forward query string' do
    QueryString.encode(a: 1, b: 'c').should eq 'a=1&b=c'
  end

  it 'handles nested hashes' do
    QueryString.encode(a: { b: 'c', d: 'e' }, f: 'g')
      .should eq 'a[b]=c&a[d]=e&f=g'
  end

  it 'handles arrays' do
    QueryString.encode(a: %w[bingo hepp]).should eq 'a[]=bingo&a[]=hepp'
  end

  it 'handles arrays of hashes' do
    QueryString.encode(a: [{ b: 'c', d: 'e' }, { b: 'g' }])
      .should eq 'a[][b]=c&a[][d]=e&a[][b]=g'
  end
end
