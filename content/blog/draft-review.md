

As I continue to think about AI-assisted workflows when developing software, the topic of reviews seems to stay top of mind. Right now, most reviews are around the current changes that are coming in via a pull request or via a delta from what you have in your previous state of Git to the next state of Git. That is very important, and I think there's a bottleneck theory here to explore and I talked about in one of my earlier articles, so I'm not going to dig into too much here.

Code review has some limited utility, and I think as we increase our velocity, that utility will only decrease. I think you need to be doing reviews of other kinds to ensure higher quality bars and compatibility with desired outcomes.

However, for the purposes of this thought, I've been thinking about how do you review an entire code base rather than just the delta?

 Most coding agents, such as CodeRabbit or Graphite, or even sub-agents that you can install, kind of look at the deltas and the changes versus looking at the entirety of the code base overall. I guess I'm looking for agents that would kind of replace what you might think of as items in the static analysis category of CI. I'm interested in looking for known security holes, patterns, known buffer overflows, and other kinds of bad coding practices that can lead to security vulnerabilities.

 I'm looking for review agents that take in the whole codebase to determine
whether you have a lot of duplicative logic that would be difficult to maintain and keep consistent
whether you have just logic, business logic perhaps, spread across too many files
Your documentation is kept updated
I want this type of review not as an afterthought, but as an aggregate view as opposed to the transaction of the pull request coming in. 

How are you solving this one? Are you?

So if you have tools or agents that you can think of that do that, I'd be happy to try them out or learn more about how you're using them in your workflows. If you want to reach me, hit me up on bluesky @stahnma.us.

