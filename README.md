# QueryString

[![CircleCI branch](https://img.shields.io/circleci/project/github/AlexWayfer/query_string/master.svg?style=flat-square)](https://circleci.com/gh/AlexWayfer/query_string/tree/master)
[![Codecov branch](https://img.shields.io/codecov/c/github/AlexWayfer/query_string/master.svg?style=flat-square)](https://codecov.io/gh/AlexWayfer/query_string/branch/master)
[![license](https://img.shields.io/github/license/AlexWayfer/query_string.svg?style=flat-square)](https://github.com/AlexWayfer/query_string/blob/master/LICENSE)

A straight forward gem to build HTTP query strings from Ruby Hashes and Arrays following the query string conventions of Rails and Sinatra. It supports Hashes, Arrays, nested Hashes and Arrays of Hashes and all combinations thereof. E.g.:

```ruby
QueryString.build(a: 1, b: 'c')
#=> 'a=1&b=c'

QueryString.build(a: { b: 'c', d: 'e' }, f: 'g')
#=> 'a[b]=c&a[d]=e&f=g'

QueryString.build(a: ['foo', 'bar'])
#=> 'a[]=foo&a[]=bar'

QueryString.build(a: [{ b:'c', d:'e' }, { b:'g' }])
#=> 'a[][b]=c&a[][d]=e&a[][b]=g'
```
