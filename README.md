# QueryString

A straight forward gem to convert Ruby Hashes and Arrays to HTTP query strings following the query string conventions of Rails and Sinatra. It supports Hashes, Arrays, nested Hashes and Arrays of Hashes and all combinations thereof. E.g.:

    QueryString.encode({a: 1, b: "c"})
    => "a=1&b=c"

    QueryString.encode({a: {b: 'c', d: 'e'}, f: 'g'})
    => "a[b]=c&a[d]=e&f=g"

    QueryString.encode({a: ['bingo', 'hepp']})
    => "a[]=bingo&a[]=hepp"

    QueryString.encode({a: [{b:'c', d:'e'}, {b:'g'}]})
    => "a[][b]=c&a[][d]=e&a[][b]=g"
