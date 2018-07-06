# QueryString

A straight forward gem to build HTTP query strings from Ruby Hashes and Arrays following the query string conventions of Rails and Sinatra. It supports Hashes, Arrays, nested Hashes and Arrays of Hashes and all combinations thereof. E.g.:

```ruby
QueryString.build({a: 1, b: "c"})
=> "a=1&b=c"

QueryString.build({a: {b: 'c', d: 'e'}, f: 'g'})
=> "a[b]=c&a[d]=e&f=g"

QueryString.build({a: ['bingo', 'hepp']})
=> "a[]=bingo&a[]=hepp"

QueryString.build({a: [{b:'c', d:'e'}, {b:'g'}]})
=> "a[][b]=c&a[][d]=e&a[][b]=g"
```
