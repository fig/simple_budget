# Refactor Demonstrator

## Original Readme
Takes in hourly pay and average weekly hours and generates a simple budget based on this information.
Works for groups of varied size to accommodate for joint households, ie couples, roommates, etc., as well as a single individual.


## Refactor Readme
I (Matt Lankford) saw this project asking for a critique of the code on reddit at : https://www.reddit.com/r/ruby/comments/7618ud/i_just_finished_my_first_ruby_program/?st=j8xtudy5&sh=4d2e1178


In it I saw many things that could be turned into lessons and thought it would be helpful to many 'noobs' to get
some insight from an old dog. It is my intention to first go through the code and refactor it and then make a video
in the same spirit as Katrina Owen in this awesome video : https://www.youtube.com/watch?v=KA9i5IGS-oU

Some of my initial thoughts are and reasons I choose this code are :

* The code actually does something the original author wanted done.
* Judging by the code,the person who wrote this code is probably an aspiring JR Sys Admin who has created a few shell or batch scripts and is probably running up against limitations that a more powerful language can bring.
* The code is very procedural in nature and does not include the word 'class' anywhere in it. This should serve as a gateway to introduce object oriented programming concepts.
* The code is not DRY, so it should be good for introducing those concepts.
* The code is not easily testable and should be a good demo for testing
* The code is using global variables and should be a good example why not to use those.
* The code worries about distinguishing functions from variables and should be a good demo for why that does not matter.
* It looks like the original author wanted to name things well but was struggling, I intend to help with that.
* The code contains a LOT of comments and presents a good way to introduce self documenting code.
* The code is also unsure of what data structures are best. This should provide a good insight into ['primitive obsession'](https://refactoring.guru/smells/primitive-obsession)
* The code is about as non idiomatic ruby as you can get and presents a great opportunity to introduce 'the ruby way'.
* The code is highly coupled which makes changing things hard. Show how orthogonality helps the coder.
