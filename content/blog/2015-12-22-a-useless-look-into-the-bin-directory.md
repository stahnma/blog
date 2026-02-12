---
title: "A useless look into the bin directory"
date: 2015-12-22
draft: false
tags: ["linux", "unix", "fun"]
categories: []
subtitle: ""
---

![](/img/medium/1__6xUldlxIg5kD5r1fjVDyZw.jpeg)

In the past, I've [written](http://sysadvent.blogspot.com/2014/12/day-20-pursuit-of-learning-through-bad.html) and [talked](https://www.youtube.com/watch?v=5ap0EsOwECs) about how I love bad ideas. I've done the same about how much I love learning. This post combines those two themes.

When I was first learning all about Unix and Linux administration, (relax — I'm not breaking into a gray beard story), I used to just surf the bin directory. This often happened during instructor lead courses, or when I had nothing better to do. I would run `ls` on the bin directory and see what commands were there. If there was a command there I hadn't heard of, I'd look at the man page, or run it or figure out what it did. I learned a whole of commands that way. Off the top of my head, I think that's how I learned about `yes`, `apropos`, `shred` and I'm sure many more.

Over the years, it's also been said many times that the internet is just a collection of unix utilities, put online and served over HTTP. As an example, google is grep, gmail is obviously mail, twitter is finger/pinky, gist is like a name pipe, etc. [/dev/null](https://devnull-as-a-service.com/) is there. Obviously whois, is there etc. Recently, I tweeted a clickbait style headline about how great awk is.

Some account called awkhub favorited (err liked) the tweet. That got me thinking, awkhub? Is there a hub for more commands? Github is the flagship example — but docker has a hub as well. Then I wondered, how many commands have a hub?

So, obviously it's time to perform some science…some very stupid science.

#### Science

For starters, I'll going to use the bin dir in a linux desktop I have. It functions as a storage server and does some other stuff for me. It's not anything completely wacky or anything. It has nearly everything from the distribution repositories and little built from source.

`/usr/bin` contains 1724 files

For each filename found in bin, let's append hub.com to it and see what happens. I realize that .com won't catch everything. I couldn't decide what TLDs were worth checking and which ones wouldn't be. I might do the analysis again with .io if I get really bored.

See [https://gist.github.com/stahnma/b5bf65a6fc1191bcdef1](https://gist.github.com/stahnma/b5bf65a6fc1191bcdef1) for full results.

195 of the 1724 have a hub.com suffix entry in DNS or about 11.3%.

Of those hub.com domains, which ones are serving out content on port 80? To do this, I grabbed `curl`. I decided that HTTP response code in the 200 or 300 range counted as valid. 400 or 500 range responses were considered to be no web presence. I realize we could debate the finer points of this broad-strokes decision, but alas, for the sake of education, I'm moving on.

The results are at [https://gist.github.com/stahnma/7cfbe9e1636a8287532f](https://gist.github.com/stahnma/7cfbe9e1636a8287532f). In the end, 141 of the 195 have a web presence. (72.3%)

If you're curious, the breakdown of response codes is:

```
Count|Response
46 <none>
94 200
25 301
22 302
6 403
1 503
1 522
```

This shows potentially 141 hub sites for unix commands. How many of those 141 are just parked or for sale or are more or less just being squatted?

This is a little bit more difficult to figure out. How does one decide if a domain is parked automatically? I had a few ideas.

1.  Manually. This seems not fun.
2.  Hash all contents, see any match? This could work, but how many contents would be identical? I would assume sites would have the domain name in the page content somewhere, so doubt sha sums would match.
3.  Try domain and domain.com/random and domain.com, if they are the same, maybe they are parked?
4.  Automate scripting and look into whois records
5.  Look at contents for keywords like buy, domain, parked etc

I decided to start with number 5. It seemed the easiest.

For this step, I ran curl to grab the headers and content of the front page on each domain and saved them to a directory. This was so I could try out a few different ideas to figure out if they were parked.

![](/img/medium/1__CoOXwHNWLzeuyVYUAzmMcw.jpeg)

```
OUTDIR=foo

#codes.log is the previous gist
mkdir -p ${OUTDIR}output ${OUTDIR}screens

for domain in `egrep ',2|,3' codes.log | cut -d, -f1`; do

cho $domain

curl -v — connect-timeout 4 -s -L $domain &> ${OUTDIR}output/$domain

done
```

I started with `grep -c -i domain * | awk -F: '{if ($2 > 4) print }'` to see any of the frontpages and headers just kept saying domain over and over. The ones that say it 30+ times, you can be sure are parked. I made the cutoff at 5 and above to see. By that measurement, 31 of domains were parked.

[https://gist.github.com/stahnma/fd0a89ada2caa719ea1b](https://gist.github.com/stahnma/fd0a89ada2caa719ea1b)

If I look for other terms, (like 'parked') only one domain shows up. That seems like it won't help. 'Buy' was another word I looked up, and came up with only 3 sites matching.

Poking at whois records for a while, I couldn't come up with patterns to search for that lead to decent results at all.

Ok, so some are parked. Beyond that, some are blank. Some are completely unrelated to unix commands. Which ones are actually the type of hub I am looking for?

Glancing at a site, I could figure out if the site was the type of unix nerd site I was looking for in about 4seconds. It would take longer than that to load them up and record the results. But completely automating this tasks seems like it would take longer than call it 10 seconds * 141 entries. (That's about 23 minutes). I didn't think I could come up with anything better in 23 minutes, and I was watching hockey, so I didn't mind. How does one grab screenshots to go through very quickly?

```
mkdir -p ${OUTDIR}output ${OUTDIR}screens

for domain in `egrep ',2|,3' codes.log | cut -d, -f1`; do

echo $domain

CutyCapt — url=http://$domain — out=${OUTDIR}screens/${domain}.png

done
```

It took 8minutes 46 seconds to grab a screenshot of each domain. Again though, I was watching hockey, so I didn't mind. We were even winning (Go Predators!)

What did I learn in looking at the screen grabs?

45 domains parked (31.0%)

18 default sites (12.7%)

16 blank sites (11.3%)

5 shopping sites (3.5%)

3 NSFW (2.1%)

#### Conclusion

The real question though, is how many of these are actually sites derived from their unix command?

Spoiler: duhub.com has nothing to do with disk space.

Seven. There were seven. (4.9%) — and that's probably being a little generous.

*   bashhub.com — bash history in the cloud
*   cpphub.com — C++ examples and programming tutorials
*   dockerhub.com — docker
*   ftphub.com — transfer files
*   github.com — github obviously
*   jqhub.com — jquery hub with info.
*   mesghub.com — dummy smtp service for testing and such

Complete chicken-scratch notes from my site review.

[https://gist.github.com/94bce274def215393dc7](https://gist.github.com/94bce274def215393dc7)

![](/img/medium/1__O9EY__fejraJzuSzUdhE4tA.jpeg)

So what have we learned? We all are dying for **m4hub**. I suspect we actually learned very little. There are several ways this analysis is flawed, and it serves almost no point.

The script I used to do this work: [https://gist.github.com/stahnma/5d1721ee11033c612938](https://gist.github.com/stahnma/5d1721ee11033c612938)

Anyway, if you build an awesome **m4hub**, let me know. My macros need somewhere to hang out.
