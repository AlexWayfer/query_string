# QueryString

A straight forward gem to convert ruby hashes and arrays to http query strings following the query string conventions of Rails and Sinatra. It supports hashes, arrays, nested hashes and arrays of hashes and all combinations thereof. E.g.:

    QueryString.encode({a: 1, b: "c"})
    => "a=1&b=c"

    QueryString.encode({a: {b: 'c', d: 'e'}, f: 'g'})
    => "a[b]=c&a[d]=e&f=g"

    QueryString.encode({a: ['bingo', 'hepp']})
    => "a[0]=bingo&a[1]=hepp"

    QueryString.encode({a: [{b:'c', d:'e'}, {b:'g'}]})
    => "a[][b]=c&a[][d]=e&a[][b]=g"
