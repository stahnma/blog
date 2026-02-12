---
title: "Codenames: Why?"
date: 2016-04-04
draft: false
tags: ["engineering", "culture"]
categories: []
subtitle: ""
---

![](/img/medium/1__tkPjKtLKKss____pbca__SGRQ.jpeg)

### Why is it a codename?

In the software business, codenames [are](https://en.wikipedia.org/wiki/List_of_Microsoft_codenames) [everywhere](https://en.wikipedia.org/wiki/List_of_computer_technology_code_names). I don't really understand the love affair with them, but it's clear they're not going away anytime soon. If you're going to use a codename for something, please stop and ask yourself **why**.

### Releases

A common use for a codename is for a specific product version release. You might give the name of a release a codename because you don't know what the version number will be. Changing the version numbers as you move along the pathway toward release can be time-consuming due to build system constraints, ticket systems hygiene , VCS branch renames, and in general mentally taxing. Ergo, sometime software engineers just use a placeholder name until the product is really ready to ship. Then they assign the proper numbers and go from there. This assumes a few good behaviors.

1.  **The codename doesn't become public**. That's not to say it's treated as a company secret or anything, it just isn't something that goes outbound.
2.  **After shipment, the release is always referred to the release version internally and externally**. (This does not include instances when the codename is the product name. See [Debian](https://wiki.debian.org/DebianReleases) or [OS X](https://en.wikipedia.org/wiki/OS_X#Versions) naming. That pattern is excluded from these thoughts.)

![](/img/medium/1__Y9cyHU66QBT7H__h1bAcvSQ.jpeg)

Ok, so if you're doing those things, I guess a codename makes some sense. Have fun with the codename. One of my recommendations to keep the codename from persisting beyond the official release date is to make it so off-the-wall nobody would say it to a potential customer, or anybody not directly involved with the act of building/shipping the software. I'd give an example of a codename that is bananas here, but then I'd be breaking rule #1 above. Trust me, it's not going public.

### Projects

Another usage of codenames I see is for naming new projects. Why? Maybe it stems from movie directors using codenames for their movies to introduce difficulties for people trying spy and leak information. (As an example, [_The Avengers_ had _Group Hug_](http://mentalfloss.com/article/52871/working-titles-14-popular-hollywood-movies) as its working title). If you're doing this to mimic the film industry, I'd politely ask you to stop. I doubt you're facing flocks of fans trying to get a peek at a set or the film star building your software.

The other reason I can think of to have a project with a codename is you're working on an ambiguous project.

> This project will allow for specific orchestration tasks on a myriad of virtualization and container platforms using a unique social platform for cloud awareness while driving brand engagement via near realtime emoji delivery to mobile enabled clients.

Ok. If you're doing that, maybe you need a codename. I recommend "lolwut" — unless you're a VC. If you are, call me. We can build this thing.

Otherwise, just call the project by what it is. Whenever you use a codename, the very first thing that has to happen is a dereference. The person hearing/reading the codename for the project has to stop, and pay a mental tax to figure out what the heck is being talked about. This tax decreases the more that single codename is dereferenced for individuals, but rears its head again in every status update or review meeting when new people have naming confusion clogging their neurons.

[![](https://cdn-images-1.medium.com/max/800/1*ioiHpYrZ7STDIYFfNr47Yw.jpeg)](https://youtu.be/ZfRr1Rcu5fw)

We're taught not to venture into pointers in C languages until we understand them and the tradeoffs they incur. We have not heeded that lesson when it comes to project names.

Then you have the worst of the worst: the project codename that's impossible to say properly out loud and spell. Not only does a dereference have to be executed each time it's heard, but anybody communicating about it in writing has to look up how to write it down so they don't look foolish. Chances are the name is from some mythology or religion thousands of years ago in a language native to exactly zero people doing the work. I guess I am supposed to be in awe of the cleverness or uniqueness of the codename for the project or the knowledge expounded upon me via name giver. I am not. I am wondering if we could just get some code shipped.

### Closing

The benefits I can see from using codenames are few. The most common, appropriate use case for codenames is in preparation for release. This us reduces the mental tax of constantly changing the numbers as the release shapes up, and makes it easier to assign the proper version number to a release. The main thing to watch out for is that the codename isn't talked about publicly, and there's no chance of confusion with the official name.

However, codenames are often used as a stand-in for cohesion in an ill-defined project. They allow an ambiguous thing to have a single name, but the process of dereferencing often creates more of a mental burden than it relieves. I'd much rather spend that effort on defining the project so it's less ambiguous, and we can name it appropriately. In short,

*   Codenames for project: bad.
*   Codenames for releases: somewhat acceptable.

So back to my original question. _Why_ do you use codenames? Are they saving you anything in terms of effort, fewer design iterations, or perhaps fewer frustrations for more than one or two folks? Names matter. Words matter. I recommend using the correct ones for the proper purpose.

_Edited by_ [_Michelle_](https://medium.com/u/d32b6647bcf0)_._

_Also, I am more proud than I should be to have worked in a WWE picture._
