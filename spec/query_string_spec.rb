require 'bundler'
Bundler.require

describe QueryString do
  it 'generates nothing if need be' do
    QueryString.build({}).should eq ''
    QueryString.build(nil).should eq ''
  end

  it 'generates a straight forward query string' do
    QueryString.build(a: 1, b: 'c').should eq 'a=1&b=c'
  end

  it 'handles nested hashes' do
    QueryString.build(a: { b: 'c', d: 'e' }, f: 'g')
      .should eq 'a[b]=c&a[d]=e&f=g'
  end

  it 'handles arrays' do
    QueryString.build(a: %w[bingo hepp]).should eq 'a[]=bingo&a[]=hepp'
  end

  it 'handles arrays of hashes' do
    QueryString.build(a: [{ b: 'c', d: 'e' }, { b: 'g' }])
      .should eq 'a[][b]=c&a[][d]=e&a[][b]=g'
  end
end
