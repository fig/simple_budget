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

first, the screen clearing routine is exactly the same at the top and bottom... lets turn that into a single method... it is a bit longer, but I want it to be absolutely explicit what I am doing... I am also going to move the top clear_the_screen down with
the other executable statements

now I am going to manually test it... it works so I will now commit

next, we have 6 statements that are printing a prompt and getting some input... perfect candidate for DRYing up... so let's
create a generic function to do that also... finding a few more comments to delete...

Some people don't like equal signs lined up... I do... because it makes it easier for me to read... so I will line them up , test
and commit...

so now... those _func_ are just really bothering me... I will just rename all of those ... the code will be shorter and easier to read

So now I will talk a min about editors... I have used many editors and have been
on a never ending quest for 'the perfect editor'... I have used many others, but currently, I am using a CODE FOLDING editor called Atom...  code folding allows you to hide code that you do not currently need to worry about... you may have noticed that the functions are 'rolled up' and you can see where they are defined... but not the code behind them... this allows my mind to look at
the code I want to see and not get distracted by code I don't.

SO... with all the functions rolled up... I am looking at the statements and the first one I get to that I don't have 100%
knowledge of is the member_register_loop... so I unroll that function and see a very amateurish attempt at a loop... let's give it
a go...

The first thing I am going to do.. is get rid of the RANGE and use a more idiomatic ruby construct ... times

Next, we will use a more idiomatic construct called reduce to get rid of the outer temp variables

Next, just as an example this time... in the future I will just routinely get rid of them without comment, in most places, ruby
does not need the parenthesis... and reading the code is a lot easier without them...

Lets make the idea of registering members a little clearer

Ok.. so as an old hand, I would normally do a VERY invasive change to the core data structures here, and the code would not work for quite a while as I made the changes... maybe 1-4 hours, but more teachable refactors exist so I will go the long way home

So the combined_monthly / annually loops are examples where idiomatic ruby is MUCH easier to read and work with...

firstly... an array already carries the number of elements in it so we don't need to pass that extra data in so let's get rid of that...

Now... I see something else I want to test... is it REALLY necessary to do the elseif in the combined_monthly function? I don't know and don't really care at the moment, because I know there is a better way that will catch that single element condition anyway...

Now we have just one more ugly loop... let's clean that up a tad

first, let's get rid of the temp variable

...

in closing, I would suggest some architectural changes now... like add more people or show report... make a non-interactive version

things like that... but those I leave to the client for now...
