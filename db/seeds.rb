s1 = Seller.create(username: "ilovecats", password: "cats")
s2 = Seller.create(username: "ilovedogs", password: "dogs")
s3 = Seller.create(username: "ilovebirds", password: "birds")

a1 = ArtPost.create(title: "hipart", description: "this is the hippist piece ever", price: 50, img_url: "https://images.unsplash.com/photo-1499781350541-7783f6c6a0c8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8YXJ0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")
a2 = ArtPost.create(title: "coolart", description: "this is the coolest piece ever", price: 75, img_url: "https://images.unsplash.com/photo-1589030343991-69ea1433b941?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")
a3 = ArtPost.create(title: "fancyart", description: "this is the fanciest piece ever", price: 200, img_url: "https://images.unsplash.com/photo-1508003516679-e4bb1a0bb0d4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fGFydHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60")