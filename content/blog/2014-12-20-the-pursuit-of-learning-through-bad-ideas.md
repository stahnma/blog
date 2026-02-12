---
title: "The Pursuit of Learning through Bad Ideas"
date: 2014-12-20
draft: false
tags: ["learning", "culture", "teams", "puppet-labs"]
categories: ["Engineering"]
subtitle: "How deliberately terrible ideas can drive genuine learning and team engagement."
---

![SysAdvent](/img/blog/sysadvent-header.png)

*Written by: Michael Stahnke ([@stahnma](https://twitter.com/stahnma))*
*Edited by: Michelle Carroll ([@miiiiiche](https://twitter.com/miiiiiche))*

*Originally published on [SysAdvent](https://sysadvent.blogspot.com/2014/12/day-20-pursuit-of-learning-through-bad.html)*

I have a confession: I love terrible ideas. I really enjoy trying to think of the absolute worst way to solve problems, largely because being a contrarian is fun. Then I realized something — coming up with the exact wrong way to solve a problem is not only a good time, but can actually be helpful.

My love for sharing terrible ideas was codified when one of my teams (and several people from other areas inside engineering) decided to embrace this behavior and create "Bad Idea Monday." After participating in several debates fueled by the the worst ideas available, some tangible benefits emerged.

Happy employees do better work. This has been proven countless times. What makes employees happy? Fun things, perks, benefits, and pay are up there, but in my experience, what really gets people engaged is learning. Encouraging and embracing new ways of learning are paramount to building the culture you want. Capturing the desire to talk about the worst ways to solve your problems provide a lot of fresh opportunities to learn.

## The worst can make you better

As you throw out the absolute worst idea possible to solve something, several outcomes can occur.

1. Your idea, while terrible, just isn't bad enough. Somebody else in the discussion thinks they can do better (worse). They try to one-up you. They often succeed, and it's amazing. This sport of spouting bad ideas leads to collaboration, as one person's idea gets picked up and added to by others.

2. A terrible idea isn't understood by everybody to be terrible. This often happens when there's a wide range of experience, either in the job, or within this specific problem domain. The discussion can help spread knowledge, as a more experienced team member explains why your solution of "install head mounted GoPro cameras for auditing purposes" might not actually make your audits any cleaner.

3. Experienced people get a new viewpoint on problems. The problems you face today may be similar to ones you've seen before. Trying to think of the worst possible solution forces you to deviate from your usual viewpoint, and can lead to another level of understanding. It can also lead to you reaching for tools or solutions that you'd normally not have considered.

4. You come up with a real, legitimate solution. It's likely one you and your team would not have arrived at without getting creative and trying to think of the worst idea. For example, choosing a Google spreadsheet[^1] as the back end for an internal service. It sounds like a terrible idea. A spreadsheet isn't really a database. It doesn't really have a great query language, it can't handle lots of updates per second, but it has access control, it's a familiar interface for non-technical folks, and doesn't require significant upgrades or maintenance.

5. The team learns to debate and discuss ideas. This is important. Because these ideas are intentionally terrible, people don't get offended when somebody shoots down the idea (or builds on it to come up with something worse). It helps the team learn how to debate properly. Learning how to dismantle ideas without judgment is a much healthier and more productive practice than attacking the person with the idea.

## How does it work?

Bad Idea Monday doesn't have to be a Monday, but it works well when it is. Because, let's be honest, Mondays are the day of the week that people normally dread. There are copious jokes, cartoons, and comics about how much we all hate the first day back at the work after a nice weekend. Capitalize on Monday's bad reputation, and use it to get your team to generate the worst possible ideas.

How do you get started? First, you need a problem. This problem could come from your ticketing system, a chat conversation, or a face-to-face discussion of something just not working the way it should. The input queue is more or less limitless. After you have a situation, don't try to solve it — at least not the way you normally would. Turn it on its head. This doesn't require a meeting. It can happen in any medium, and occur numerous times throughout the day.

Allow me to walk through an example.

## Bad Idea Monday in practice

When Puppet Labs was moving our server-side stack from a Ruby-based solution to Clojure and JRuby, we uncovered a new set of problems. We knew we needed a JRE, but that was about all we knew. Did we need a specific JRE? Did we want to compile a JVM for the ~30 permutations of platforms supported as masters on Puppet Enterprise? Were we going to have to package it? Did we want to require that the end-user brings in `libalsa` because that's what normal JVMs do?

So the fundamental problem: how do we ship/bundle a JVM to our enterprise customers? What's the worst answer to this? We could just unzip a binary of the JVM and somehow work it into our filesystem path — that solution was rejected because it wasn't bad enough. We could use `netcat` and `dd` for distribution, but that wasn't that interesting enough. Then we got an idea. An awful idea. We got a wonderful, *awful* idea!

![the grinch gets a bad idea](/img/blog/grinch-bad-idea.gif)

We ship the JVM as a gem. Rubygems allows you to compile things on the fly. Rubygems is cross platform. Rubygems is available over the network. Sure, this content wasn't Ruby, but why should that stop us?

This is a terrible idea. Why? Well, you would need way too many dependencies. You have to have Ruby on the box already. You have to be connected to a network for a successful installation. You can't express C-header dependencies in Rubygems. You have to have a compiler on the target system. You have to wait something like 35 minutes for the JDK to compile during a Rubygems installation. In most cases, you actually need a JVM in order to bootstrap and compile a JVM. You have to write a mkmf file to instruct the machine how to do that. At the time, signing gems was basically unheard of. You probably don't want the JVM in your Ruby load path, but maybe you could move the files in a gem postinstall with enough finagling.

This conversation ended shortly after it started, with the team providing these counterexamples, in addition to others not covered here. We knew it was doomed. It was fun though.

We ended up shipping a version of OpenJDK that we built and optimized for our workload using the native package manager for the platforms. However, when we were dealing with some pretty hairy Ruby problems in subsequent releases, we were able to build on our knowledge of the limitations (and advantages) of the more esoteric features of Rubygems — stuff we'd looked into while identifying why it was the worst way to deliver a Java solution. When we needed to bundle some Ruby content with our distribution, that earlier discussion was extremely useful.

## What did we learn from the conversation?

- Knowledge of some of the newer (and esoteric) features of Rubygems. By the end, we'd figured out answers to questions like. What does the postinstall situation really look like? What's the state of signing a package? What type of compiler manipulation can reasonably be done and expected on an end-user's system?
- Why library managers are bad general purpose package managers.[^2] This may seem obvious, but it's a good discussion for those who haven't really thought about it.
- Bootstrapping a JVM is a hard problem.

We also had a great time thinking of ways to bend Rubygems to our will.

## The rest of the week

The team liked Bad Idea Monday so much, they created theme days for the rest of the week. I'll walk through them quickly:

**Positive Tuesday**. This is a day to be positive. The original intent was to offset the perceived negativity perpetuated with bad ideas that happened on Monday, but it's really not needed for those reasons. The thing I like about it is the 'find something you like about it' attitude, which sometimes can help. Everything is not always wonderful. When it's not, at least on a Tuesday, we can try to improve our outlook by identifying the good parts (or potentially decent outcomes) of an otherwise less-than-awesome situation. This assists in scenarios where you may have lost a debate, but need to move forward. It can bolster a "disagree and commit" interaction paradigm.

**Noncommittal Wednesday**. Why make a decision today when you could put it off until tomorrow? I think this started as the neutral leg of to balance the bad (Monday) and good (Tuesday). Since then, this day hasn't done much. I mean, I could tell you more about it, but I just can't seem to commit to it.

**Troll Thursday**. Trolling your coworkers can be fun. We keep it pretty clean and innocent, but some days, you just have to see if you can engage the team on something ridiculous, believe some crazy story, or convince them that DECnet[^3] really is the one true networking protocol. I enjoy Troll Thursday because it can be used for learning rather than simply for my own amusement. Also, I am not immune to being trolled. ABT.

**FriDre**. On Friday, two things happen. One, somebody will forget. Two, we will remind them. Heck, our chat bot will remind you. I'll admit that Not Forgetting About Dre[^4] is a little less fun now that he's the first billionaire in hip hop. Nonetheless, remembering Dre is something that's been a part of the culture at Puppet Labs for a long time — nearly as long as I've been on board. What purpose does it serve? Other than being fun, I have no idea. I'm even pretty sure I'm the one who decided we shouldn't forget about Dre.

## Conclusion

These theme days have made it easier for me to demonstrate three things: the team is creative, they have fun while they work, and they're an awesome group. We have a wide variety of people, ranging from their mid-twenties to mid-forties. We have people who have worked in tech for years, and people in their first technical role. Some live the US, and at least one doesn't. We're not all men. We're not all packaging geeks. In short, it's a good mix. A big part of building this team and culture has been finding ways to keep things fun and by driving learning, even as the organization grows and faces new sets of challenges. I encourage you to take an unorthodox look at encouraging learning, management styles, and the non-technical ideas your teammates are bringing to the table — maybe you'll find something new to dive into.

[^1]: If you're wondering, [www.puppetlabs.com/beer](http://www.puppetlabs.com/beer) is backed by a Google spreadsheet.
[^2]: An excellent talk by Ryan McKern called "[Packaging is the Worst Way to Distribute Software, Except for Everything else](https://www.usenix.org/conference/ures14west/summit-program/presentation/mckern)."
[^3]: [DECnet on Wikipedia](http://en.wikipedia.org/wiki/DECnet)
[^4]: [This can help you remember.](http://i.imgur.com/dDH9L6H.jpg)

### Further Learning

- [Wikipedia page on Organizational Learning](http://en.wikipedia.org/wiki/Organizational_learning)
- [Improving Students' Critical Thinking and Classroom Engagement by Playing the Devil's Advocate](http://traue.commons.gc.cuny.edu/issue-2-fall-2013/davis/)
- [7 Steps to Analyze a Problem – The Devil's Advocacy Technique](http://www.ryanhartwig.com/7-steps-to-analyze-a-problem-the-devils-advocacy-technique/)
