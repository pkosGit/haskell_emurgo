# 1. Meaning of in operator 

## in goes along with let to name one or more local expressions in a pure function.

So, to use a simpler example,

foo = 
  let greeting = "hello" in 
    print (greeting ++ " world")
would print "hello world".

But you could also use lots of lets:

foo = 
  let greeting = "hello"
      greetee  = "world" in
    print (greeting ++ " " ++ greetee)
And you just need one in before you use the names you just defined.

And these names definitely don't have to be used as parameters to a function -- they can be just about anything, even functions themselves!

foo = 
  let f = print in
    f "hello world"
In your example, the let expression is defining two names, n and ns, which are used in the body of the function.


# Foldr
Say we want to calculate the sum of a very big list:

> veryBigList = [1..1000000]
Let's start with the following:

> foldr f z []     = z
> foldr f z (x:xs) = x `f` foldr f z xs

> sum1 = foldr (+) 0

> try1 = sum1 veryBigList