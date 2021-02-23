s1 = Seller.create(username: "ilovecats", password: "cats")
s2 = Seller.create(username: "ilovedogs", password: "dogs")
s3 = Seller.create(username: "ilovebirds", password: "birds")

a1 = ArtPost.create(title: "hipart", description: "this is the hippist piece ever", price: 50)
a2 = ArtPost.create(title: "coolart", description: "this is the coolest piece ever", price: 75)
a3 = ArtPost.create(title: "fancyart", description: "this is the fanciest piece ever", price: 200)