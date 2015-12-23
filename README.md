# sinos-river-scraper-twitter

Read and parse sinos river level from twitter streams.

## Install

```console
npm install -g https://github.com/paulodiovani/sinos-river-scraper-twitter
```

## Usage

```console
usage: sinos-river-scraper-twitter [OPTIONS]

OPTIONS:
  -q, --query,
  -s, --search   Search old tweets
  -w, --wait,
  -l, --listen,
  --stream       Wait for new tweets stream
```

### Example

```console
$ TWITTER_CONSUMER_KEY=[your twitter app consumer key] \
> TWITTER_CONSUMER_SECRET=[your twitter app consumer secret] \
> sinos-river-scraper-twitter -q "#RiodosSinos #NovoHamburgo from:ComusaNH"

Measure in Wed Dec 23 10:28:46 +0000 2015, at 7h: 2,98m
Measure in Tue Dec 22 09:51:40 +0000 2015, at 7h: 3,02m
Measure in Mon Dec 21 13:50:04 +0000 2015, at 1h: 3,15m
Measure in Fri Dec 18 10:42:48 +0000 2015, at 7h: 3,28m
Measure in Thu Dec 17 16:42:38 +0000 2015, at 3h: 3,53m
Measure in Wed Dec 16 10:08:22 +0000 2015, at 8h: 3,88m
```
