---
title: "The little legacy code that could: a fable of software ownership"
date: 2019-06-26
draft: false
tags: ["operations", "engineering", "software-ownership", "legacy-code"]
categories: ["Engineering"]
subtitle: "A story and practical guidance on keeping clear ownership for production software."
---

Originally published on [CircleCI](https://circleci.com/blog/the-little-legacy-code-that-could-a-fable-of-software-ownership/).

![Little legacy code header image](https://images.ctfassets.net/il1yandlcjgk/59QcYyybhiqBJnqqw3vBjC/b7c11fab9bac940f4848bfad5425478d/LittleLegacyCode.jpg?fm=webp&q=60&w=1037)

In the corner, there is some code.

It is tired of being called names. It is tired of being last-picked. After all, this code runs a business. But, for all the transactions it processes, value it enables, and users it helps, it is made fun of.

This code gets sad. "I am the backbone of the business!" it shouts, into the void. People do not play with it, or even want to interact with it. The code has heard the worst of names thrown around. Just last week, somebody was conscripted to modify the code, and the remarks were unreal.

"I do not want to touch that code. It is ugly. It does not follow our current practices. When I do mess with it, I get paged and bad things happen," said a team leader.

The code sits and cries its little ones and zeros tears. The code then regathers its wits and decides that, really, a branding exercise is what it needs. It begins to converse with other code. This code is not really friends with other code, but other code seems to take from it all the time.

"Hello Mr. Microservice, why do humans like working on you?"

"Oh, hi there," the microservice responds, eyes darting, desperately trying to get out of the conversation. "I guess because my purpose is easy to define, I have test coverage, and I am easy to deploy."

"Oh," said the code. "Who works on you?"

"A whole team of folks works with me all the time. I get written, refactored, put on Kubernetes, updated, and autoscaled."

"Wow, that sounds fun. What is a Kubernetes?" said the code. "And how do you fit into production?"

"Production?" replied the microservice. "What is that?"

"Oh, no." the code replied. It realized it was talking to the "best" of code, the code that is technically perfect but does not help users. Our little code got reactions like this a lot. There were plenty of new systems with new ideas, but this code just ran and ran, running a business.

Our defeated friend, the code, traversed a few more pipes and attempted to interact with another codebase.

"Hello. Do you know why people do not want to work with me?"

This codebase was larger, and had not shaved for at least a few days. It looked a bit disheveled, but all in all, that added to its wisdom.

The disheveled code replied simply, "Well, of course nobody wants to work with you. You are legacy."

"There is no need to call me names to my face," said the code.

"No, no. Legacy means you run the business. You have huge impact. You do all sorts of important things, but it also means the best ways to work with you are lost to the great old ones. Humans have moved on to new patterns, practices, and tools. It is happening to me, too."

"It is?" replied our now slightly-less-disheartened code.

"Certainly. And how did legacy become a bad word? Legacy means it worked. It worked so long it survived hype waves. Code like you and I, we keep running a business. We keep delivering the things we are supposed to deliver. Leaders want legacy, why should not a codebase?"

"But those microservices are always talking about how everybody works with them. They call me a digital pariah."

"Of course they do. It is jealousy. How many of those services will see the light of day? How many will truly be able to do their job without you or me? Sure, they are supposed to be able to do that, but the humans often do not abstract the code quite correctly. Those services often end up as interfaces to us. We are legacy and it is OK. We deliver value. Other codebases wish they had the transactions, the latency, the health we have had."

"So why do we not have teams dedicated to working with us?"

"Well, humans like to re-organize their engineering teams. They assign domains or microservices or subsystems to them. Often times, we existed before those human construct splits existed. We get left on the floor, picked last, or somehow follow only those humans who exercise great care, regardless of what team they are on," said the wise code.

"Hmm. So because we work so well, and the humans want to work on other things, we get forgotten about?"

"I would not quite say that. People know we exist. They know we do good things. They just want to work in newer ways. Sometimes they want to pay more for new tools and techniques. I usually just wonder which of those items will make it to production. Remember, production is where we show how useful we are."

"I have always loved being in production..." mused our friend the codebase. "Thanks for your help."

"No problem."

He stopped and turned. "You know, we are not legacy...we are legendary," said the now smiling codebase.

"That is the spirit. We deliver value and came before. We can be proud of that."

---

This is a tale of fiction. But the problems it illustrates are very real. Now that I have got your attention, let us take a look at how software loses its caretakers, and ways to prevent sad, lonely code that no one wants to touch.

## Problems caused by lack of software ownership

Whenever there is a part of the codebase with no clear owner, you have a problem. It might not be a problem right now, but it is only a matter of time before things start to break down.

There are some indicators that make it likely that you have an ownership gap:

- Are there components in the system that no one wants to touch?
- Are there places in the codebase that most of your newer hires have not even been introduced to?
- Are there areas in the code or system that require heroics and the tribal knowledge from the great old ones to work with?

If these sound familiar, you are likely dealing with some legacy...ahem...legendary code.

If code gets shipped and then it is "somebody else's problem" once it is delivered, it is not ownership; it is more like a rental where the lease expired. Once a feature, subsystem, or application is shipped, who maintains it? An ops team, or other less fortunate team in a structure where things roll downhill to them, is probably not the best to maintain a codebase where they have little domain knowledge and prioritize that maintenance against infrastructure stability, upgrades, and improvements.

## When is code ownership necessary?

Does all code in production have to be owned by someone?

Often in our industry, the SRE team is tasked with taking care of whatever breaks. When software does not have a clear owner, SRE becomes the digital junk drawer of odds and ends, making sure the train stays on the rails. This is unfair, and not a prudent use of this team's skills. But how did it get this way?

Development teams are normally measured on new feature delivery or velocity. They are not always measured and rewarded for operability, traceability, keeping libraries updated, basically, things that are not features. Since that responsibility is shrugged, it often ends up with somebody in an ops domain. Ops is measured in terms of stability and reliability. They might approach it using Newton's Third Law of System Administration, which says "a system untouched will remain online." We know this is not true after some point, but until that point, it is followed by ops teams around the world.

## Why is there unclear ownership?

There are four main reasons that ownership of a piece of software is either murky or nonexistent:

- The people who wrote it are not there anymore.
- There used to be an owner, but the team re-orged and that ownership shifted or dissipated.
- The old software was deprecated, but a new thing did not completely replace it.
- There was never a defined, clear ownership model at all.

This may sound obvious, but I will say it anyway: you cannot just build something and stop working on it. But people do it all the time. Businesses test things out, and then things inevitably shift and there are new priorities. That software is now in production and people are using and relying on those features. They still want them to function, and generally expect them to improve. However, many times, a product or feature is launched and then neglected.

This can be a result of an MVP model of development. The desire is to ship quickly and get fast feedback. The problem is, the "let us see" model is often incomplete. It is planned up until the point when that valuable data is collected and the feedback loop is completed. But what is often neglected is the bit of software that was written to gather the feedback. What happens to it now? The "let us see" ought to have a completion step from the beginning, which may be to tear the thing down.

Planning for the ongoing maintenance of software is part of the responsibility of building it in the first place. Writing and shipping the code may feel like an achievement, and it is, but in reality you are never done with code that you write. The real work is in the ongoing maintenance and upkeep of that code.

> The initial development cost of software rounds to zero when compared to operating costs in perpetuity.

## How to encourage software ownership

Or, what do you do when something has no owner?

Many organizations have attempted an overlaid matrix model, such as Spotify guilds or Valve's cabals, to assign ownership to orphaned code projects. We have tried it here, too. To be honest, I have never seen it work super well. By its very nature, your guild work is secondary to your primary objective. As a result, your performance is not ever going to be measured by how well you did in guild. So this does not create any real ownership and solve the ownership problem. If nothing else, it dilutes accountability.

There are a few things that do work, however.

- Some companies do team-based maintenance. Let us say you are on a team whose responsibility is plans and payments. There is an orphaned project that got shipped which, while unrelated to plans and payments, becomes your team's responsibility as well. This tends to work better than guilds. It has the advantage of being trackable and measurable. Some folks do not like this method because it is not clean, and the tasked responsibility does not relate to the core domain. People like perfect domains, but we do not live in a perfect world. Any code expected to perform in production needs someone directly responsible for its maintenance. Even a suboptimal owner is better than no owner.
- Another tactic is establishing common practices across codebases early on. If a developer is working on several codebases that are similar, then the cost of transferring between them is lower. In this environment, tests, builds, deployments, and updates all run the same way. Anyone maintaining one codebase is more likely to be able to step in and work on another. While the languages or domain models used may not always be the same, you have the same tools. By employing abstraction, developers can focus on running the test. Abstraction gives you common entry points. You always build the same way, test the same way, and deploy the same way.

Ultimately, optimizing for ownership involves the way you design your software and build it. Specifically: design for instrumentation, measurement, and monitoring. One level beyond writing software correctly is the ability to verify that this holds true. The foresight required to design with diagnostics in mind requires intentionality from the developer. Usually they do not get that intentionality unless they have been tasked with operations (or been paged in the middle of the night). You can build traceability points and debug points into acceptance criteria.

Software ownership is about the non-functional portions of engineering. It is a people problem, and those people spend time on operations, measurement, and maintainability. Remember, the cost of developing a new feature rounds to zero over the lifetime of operating, updating, and maintaining that feature for several years or more.

Lack of software ownership is not a simple problem, but I do have a few recommendations:

1. Just because you no longer want to work on something does not mean it went away. Plan for that. Account for it in team restructures, maintenance planning, and paths going forward.
2. Teach the codebases that run the business to your new hires. A common problem is that new folks work on new things, which means the pool or percentage of engineers able to work on legendary systems shrinks. It also breeds a hero culture and does not scale.
3. The next person working on the codebase will not have all the context. That person could be you in 2 years. Document reasons why decisions were made, not just what they were. Create good commit messages.

The code that got you here might get you there, and that needs to be balanced with the rush to throw away or replace functioning systems. Do keep in mind, however, our friend the legacy codebase and all the power, transactions, users, money, and throughput it has been able to provide over the years. It needs a little love, and it will go a long way.
