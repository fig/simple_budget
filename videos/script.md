### First things first

we have 218 lines in this file and not a single class statement.

Ok... let's read the comments and see what the author thinks

firstly... it is a multi-person budget creator, mainly to see how much someone can afford to spend on housing. This is not a bad
comment to have

but then it gets into a lot of verbosity about how he is gonna give function names _func endings in order to distinguish them
from variables... not only should you not do that, the language is MEANT to be that way.

it goes on to explain the member and the members variables... this is a case of 'primitive obsession' as these should be classes
that are obvious what they are doing...

then it explains the use of the variable holding the instance of the class...

this comes from inexperience with the OO paradigm

and to wrap all of that up... we have a comment that explains future comments... ;)

_________

Let's run the code and see what happens

ok... so everything seems to work ... in the sense that it asks for input... I put it in and it gives me a result.

I have no idea if it is correct or not, but the author is content with it atm and my job is NOT to CHANGE THE BEHAVIOR but
to make the codebase easier to understand / work with / but most importantly ... easier to change.

I am here to REFACTOR.

What is refactoring / importance of tests?

So... in order for me to absolutely KNOW I am not changing the BEHAVIOR, I need to have a given input ALWAYS give me the
same output...

manually test and show how painful manually testing can be by making a change that modifies the output but LOOKS correct

Now ruby has a built in testing framework, minitest, but this is an interactive commandline app... and minitest
is not an 'integration' test suite, rather it is a UNIT test suite

Still, we need to know if the BEHAVIOR is changing in order to know if our changes break things..

modular code is easier to test, but we don't have that here...

Since I am familiar with UNIX and the commandline... I will show you a quick and dirty way to do this... it will not work
in every instance, but should work nicely here...

now let's start changing things with confidence

________

so the first change I am going to make is pretty benign... I am gonna delete some comments...

I am only leaving the program description at the top... because that really was the only useful comment.

Then I am going to run the test... that works... now I am going to commit the changes.

ok... let's DRY up the code a bit to make it a little more readable
