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

Full results:

```
achub.com
ackhub.com
aliashub.com
analoghub.com
arhub.com
archhub.com
ashub.com
athub.com
awkhub.com
bashhub.com
bchub.com
bghub.com
bluemoonhub.com
bodhihub.com
calhub.com
cancelhub.com
cathub.com
cdhub.com
cinnamonhub.com
clearhub.com
cmphub.com
colhub.com
columnhub.com
commhub.com
commandhub.com
coveragehub.com
cphub.com
cpphub.com
csslint-0.6hub.com
cuthub.com
datehub.com
dchub.com
ddhub.com
dfhub.com
diffhub.com
dighub.com
dirhub.com
dockerhub.com
domainnamehub.com
dtchub.com
duhub.com
easy_install-3.4hub.com
echohub.com
edhub.com
envhub.com
exhub.com
expandhub.com
factorhub.com
fchub.com
fghub.com
filehub.com
findhub.com
fingerhub.com
flockhub.com
freehub.com
ftphub.com
gcchub.com
gemhub.com
GEThub.com
github.com
gpghub.com
gshub.com
gst-inspect-1.0hub.com
gst-launch-1.0hub.com
gst-typefind-1.0hub.com
gupnp-dlna-info-2.0hub.com
gupnp-dlna-ls-profiles-2.0hub.com
hangulhub.com
hosthub.com
hubhub.com
idhub.com
infohub.com
installhub.com
javahub.com
jobshub.com
joinhub.com
jqhub.com
lasthub.com
ldhub.com
lddhub.com
ld.goldhub.com
linkhub.com
lnhub.com
localehub.com
locatehub.com
loginhub.com
lookhub.com
lphub.com
lprhub.com
lshub.com
lsusb.pyhub.com
m4hub.com
mailhub.com
Mailhub.com
manhub.com
mesghub.com
mockhub.com
morehub.com
mvhub.com
nanohub.com
nchub.com
nemohub.com
nethub.com
nicehub.com
nlhub.com
nmhub.com
odhub.com
openhub.com
passwdhub.com
pastehub.com
perlhub.com
perl5.18.4hub.com
pfchub.com
pinghub.com
pinkyhub.com
pip3.4hub.com
plymouthhub.com
POSThub.com
prhub.com
pshub.com
puppethub.com
pwdhub.com
pydoc3.4hub.com
pythonhub.com
python3.4hub.com
pyvenv-3.4hub.com
quotahub.com
rawhub.com
rbhub.com
readhub.com
redhub.com
resethub.com
revhub.com
rhinohub.com
rihub.com
rmhub.com
rpmhub.com
rsyslog-recover-qi.plhub.com
rubyhub.com
sandboxhub.com
sbhub.com
screenhub.com
scripthub.com
sedhub.com
seedhub.com
seqhub.com
sghub.com
shhub.com
shredhub.com
sizehub.com
skillhub.com
splithub.com
sshhub.com
stathub.com
stringshub.com
striphub.com
suhub.com
sudohub.com
sumhub.com
sxhub.com
synchub.com
szhub.com
tabshub.com
tachub.com
talkhub.com
tblhub.com
teehub.com
testhub.com
tichub.com
timehub.com
toehub.com
tophub.com
totemhub.com
trhub.com
treehub.com
truehub.com
uniqhub.com
uptimehub.com
vihub.com
vimhub.com
whub.com
waithub.com
wallhub.com
watchhub.com
wchub.com
whatishub.com
whereishub.com
whohub.com
whoishub.com
writehub.com
Xhub.com
yelphub.com
yeshub.com
yumhub.com
ziphub.com
```

195 of the 1724 have a hub.com suffix entry in DNS or about 11.3%.

Of those hub.com domains, which ones are serving out content on port 80? To do this, I grabbed `curl`. I decided that HTTP response code in the 200 or 300 range counted as valid. 400 or 500 range responses were considered to be no web presence. I realize we could debate the finer points of this broad-strokes decision, but alas, for the sake of education, I'm moving on.

The results are below. In the end, 141 of the 195 have a web presence. (72.3%)

```
achub.com,302
ackhub.com,301
aliashub.com,200
analoghub.com,200
arhub.com,200
archhub.com,200
ashub.com,301
athub.com,301
awkhub.com,
bashhub.com,301
bchub.com,200
bghub.com,403
bluemoonhub.com,
bodhihub.com,200
calhub.com,302
cancelhub.com,
cathub.com,200
cdhub.com,301
cinnamonhub.com,
clearhub.com,200
cmphub.com,302
colhub.com,200
columnhub.com,200
commhub.com,302
commandhub.com,200
coveragehub.com,200
cphub.com,403
cpphub.com,301
csslint-0.6hub.com,200
cuthub.com,301
datehub.com,200
dchub.com,200
ddhub.com,200
dfhub.com,
diffhub.com,
dighub.com,200
dirhub.com,403
dockerhub.com,301
domainnamehub.com,403
dtchub.com,
duhub.com,200
easy_install-3.4hub.com,
echohub.com,200
edhub.com,
envhub.com,
exhub.com,200
expandhub.com,301
factorhub.com,
fchub.com,200
fghub.com,
filehub.com,
findhub.com,200
fingerhub.com,302
flockhub.com,200
freehub.com,200
ftphub.com,200
gcchub.com,200
gemhub.com,503
GEThub.com,
github.com,301
gpghub.com,302
gshub.com,
gst-inspect-1.0hub.com,200
gst-launch-1.0hub.com,200
gst-typefind-1.0hub.com,200
gupnp-dlna-info-2.0hub.com,200
gupnp-dlna-ls-profiles-2.0hub.com,200
hangulhub.com,200
hosthub.com,200
hubhub.com,200
idhub.com,301
infohub.com,301
installhub.com,200
javahub.com,200
jobshub.com,403
joinhub.com,301
jqhub.com,200
lasthub.com,
ldhub.com,
lddhub.com,200
ld.goldhub.com,200
linkhub.com,
lnhub.com,
localehub.com,
locatehub.com,302
loginhub.com,
lookhub.com,200
lphub.com,200
lprhub.com,
lshub.com,
lsusb.pyhub.com,302
m4hub.com,302
mailhub.com,200
Mailhub.com,200
manhub.com,301
mesghub.com,301
mockhub.com,302
morehub.com,200
mvhub.com,200
nanohub.com,200
nchub.com,200
nemohub.com,200
nethub.com,200
nicehub.com,200
nlhub.com,
nmhub.com,200
odhub.com,
openhub.com,
passwdhub.com,200
pastehub.com,302
perlhub.com,200
perl5.18.4hub.com,200
pfchub.com,301
pinghub.com,200
pinkyhub.com,301
pip3.4hub.com,200
plymouthhub.com,302
POSThub.com,200
prhub.com,200
pshub.com,200
puppethub.com,301
pwdhub.com,
pydoc3.4hub.com,200
pythonhub.com,302
python3.4hub.com,200
pyvenv-3.4hub.com,200
quotahub.com,
rawhub.com,302
rbhub.com,200
readhub.com,
redhub.com,403
resethub.com,200
revhub.com,200
rhinohub.com,302
rihub.com,200
rmhub.com,200
rpmhub.com,200
rsyslog-recover-qi.plhub.com,302
rubyhub.com,
sandboxhub.com,301
sbhub.com,302
screenhub.com,200
scripthub.com,200
sedhub.com,200
seedhub.com,
seqhub.com,
sghub.com,200
shhub.com,200
shredhub.com,
sizehub.com,
skillhub.com,
splithub.com,200
sshhub.com,200
stathub.com,302
stringshub.com,522
striphub.com,200
suhub.com,200
sudohub.com,200
sumhub.com,
sxhub.com,
synchub.com,200
szhub.com,200
tabshub.com,302
tachub.com,200
talkhub.com,
tblhub.com,
teehub.com,
testhub.com,301
tichub.com,301
timehub.com,200
toehub.com,301
tophub.com,200
totemhub.com,
trhub.com,
treehub.com,200
truehub.com,
uniqhub.com,
uptimehub.com,200
vihub.com,200
vimhub.com,200
whub.com,200
waithub.com,
wallhub.com,200
watchhub.com,301
wchub.com,200
whatishub.com,302
whereishub.com,200
whohub.com,301
whoishub.com,200
writehub.com,302
Xhub.com,302
yelphub.com,301
yeshub.com,200
yumhub.com,
ziphub.com,200
```

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

```
$ grep -c -i domain * | awk -F: '{if ($2 > 4) print }'

achub.com:10
analoghub.com:5
ashub.com:8
cdhub.com:46
commhub.com:9
csslint-0.6hub.com:9
cuthub.com:60
fchub.com:9
fingerhub.com:5
joinhub.com:60
lddhub.com:5
lsusb.pyhub.com:8
mailhub.com:9
Mailhub.com:9
mockhub.com:7
nethub.com:20
pastehub.com:9
plymouthhub.com:8
POSThub.com:6
puppethub.com:7
rawhub.com:9
rhinohub.com:9
rihub.com:7
rpmhub.com:5
sandboxhub.com:71
sbhub.com:9
splithub.com:7
stathub.com:9
tabshub.com:8
wchub.com:276
whub.com:9
```

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

```
achub.com - parked
ackhub.com - web dev site
aliashub.com - parked
analoghub.com - default site
archhub.com - apache index of a cgi-bin
arhub.com - blank
ashub.com - parked
*bashhub.com - bash history in the cloud
bchub.com - parked
bodhihub.com - default site
calhub.com - collaboration company
cathub.com - parked
cdhub.com - parked (even worse parked page says 404, but HTTP response is not a 404 :/ )
clearhub.com - something form singapore
cmphub.com - requests google login
colhub.com - blank
columnhub.com - default site
commandhub.com - security site
commhub.com - parked
coveragehub.com - insurance
*cpphub.com - C++ examples and programming tutorials
csslint-0.6hub.com - parked
cuthub.com - parked
datehub.com - blank
dchub.com - blank
ddhub.com - dream dinners
dighub.com - gerber life insurance
*dockerhub.com - docker
duhub.com - shopping
echohub.com- conference site
exhub.com - ad serving
expandhub.com - redirects to reallycooltoys (shopping)
fchub.com - parked
findhub.com - search engine
fingerhub.com - redirect to fingerhut shopping
flockhub.com - default site
freehub.com - default site
*ftphub.com - transfer files
gcchub.com - telecom
*github.com - github obviously
gpghub.com - suspended account
gst-inspect-1.0hub.com - parked
gst-launch-1.0hub.com - parked
gst-typefind-1.0hub.com - parked
gupnp-dlna-info-2.0hub.com - parked
gupnp-dlna-ls-profiles-2.0hub.com - parked
hangulhub.com - blank
hosthub.com - parked
hubhub.com - blank
idhub.com - interaction design wordpress blog
infohub.com - vacations
installhub.com - blank
javahub.com - parked
joinhub.com - parked
*jqhub.com - jquery hub wtih info.
lddhub.com - blank
ld.goldhub.com - default site
locatehub.com - apache 2 ubuntu default site
lookhub.com - shopping
lphub.com - default site
lsusb.pyhub.com - parked
m4hub.com - raise funds
mailhub.com - parked
Mailhub.com - parked
manhub.com - guess, seriously would you type this in?
*mesghub.com - dummy smtp service for testing and such
mockhub.com - default site
morehub.com - parked
mvhub.com - merrimack valley community services directory
nanohub.com - default site
nchub.com - blank
nemohub.com - some default CMS
nethub.com - global ventures brand building
nicehub.com - forums for anything
nmhub.com - band website
passwdhub.com - manage passwords (looks shady)
pastehub.com - parked
perl5.18.4hub.com - parked
perlhub.com - parked
pfchub.com - project finance consulting
pinghub.com - parked
pinkyhub.com - adult content
pip3.4hub.com - parked
plymouthhub.com - parked
POSThub.com - parked
prhub.com - PR firms (marketing)
pshub.com - default site
puppethub.com - A global network for professionals, amateurs, and people who just like puppets.
pydoc3.4hub.com - parked
python3.4hub.com - parked
pythonhub.com - github redirect to pythonhub account
pyvenv-3.4hub.com - parked
rawhub.com - parked
rbhub.com - parked
resethub.com - blank
revhub.com - blank
rhinohub.com - parked
rihub.com - parked
rmhub.com - parked
rpmhub.com - default site
rsyslog-recover-qi.plhub.com - search
sandboxhub.com - parked
sbhub.com - parked
screenhub.com - manage marketing screens
scripthub.com - default site
sedhub.com - All is says is "This is an old instance. Do not use this instance."
sghub.com - personal site for Kenshin.sg
shhub.com - blank
splithub.com - parked
sshhub.com - blank
stathub.com - parked
striphub.com - parked
sudohub.com - default site
suhub.com - web dev saas provider
synchub.com - default site
szhub.com - something in Chineese
tabshub.com - parked
tachub.com - training and consulting
testhub.com - community software testing (german)
tichub.com - 403 this time
timehub.com - media production
toehub.com - nsfw
tophub.com - pictures
treehub.com - family tree stuff
uptimehub.com - blank
vihub.com - German cisco reseller or trainer
vimhub.com - web server index
wallhub.com - blank
watchhub.com - sells watches
wchub.com - parked
whatishub.com - search
whereishub.com - travel
whohub.com - interview archives
whoishub.com - default site
whub.com - parked
writehub.com - editors and sdks and IDEs
Xhub.com - software of some kind
yelphub.com - blank
yeshub.com - default site
ziphub.com - shopping
```

![](/img/medium/1__O9EY__fejraJzuSzUdhE4tA.jpeg)

So what have we learned? We all are dying for **m4hub**. I suspect we actually learned very little. There are several ways this analysis is flawed, and it serves almost no point.

The script I used to do this work:

```bash
#!/bin/bash

OUTDIR=thehubs

n=`ls -1 /usr/bin | wc -l`

echo "/usr/bin contains $n files"

function findhubs() {

for file in `ls -1 /usr/bin`

do

if host ${file}hub.com &> /dev/null ; then

echo "Domain found for ${file}hub.com "

echo ${file}hub.com >> hub.log

fi

done

}

function findwebs() {

for domain in `cat hub.log`

do

echo -n $domain,

str="$domain,"

#response=`curl -s -I -L $domain | head -1 | awk '{print $2}'`

curl --connect-timeout 4 -s -I -L -o file $domain

if [ $? == 0 ] ; then

head -1 file | awk '{print $2}'

str+=`head -1 file | awk '{print $2}'`

else

echo

fi

echo $str >> codes.log

done

}

function statweb() {

cut -d, -f2 codes.log | sort | uniq -c

}

function isitparked() {

mkdir -p ${OUTDIR}output ${OUTDIR}screens

for domain in `egrep ',2|,3' codes.log | cut -d, -f1`

do

echo $domain

curl -v --connect-timeout 4 -s -L $domain &> ${OUTDIR}output/$domain

CutyCapt --url=http://$domain --out=${OUTDIR}screens/${domain}.png

done

}

findhubs

findwebs

statweb

isitparked
```

Anyway, if you build an awesome **m4hub**, let me know. My macros need somewhere to hang out.
