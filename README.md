[![Build Status](https://travis-ci.org/paulodiovani/sinos-river-level-twitter.svg?branch=master)](https://travis-ci.org/paulodiovani/sinos-river-level-twitter)

# sinos-river-level-twitter

Read and parse sinos river level from twitter streams.

Full documentation at [paulodiovani.github.io/sinos-river-level-twitter](http://paulodiovani.github.io/sinos-river-level-twitter/)

## Install

```console
npm install -g sinos-river-level-twitter
```

## Usage

### From command line

Note: Twitter key and secret ad mandatory.

```console
usage: sinos-river-level-twitter [OPTIONS]

OPTIONS:
  -q, --query,
  -s, --search   Search old tweets

  --twitter-key
  --key          Twitter consumer key

  --twitter-secret
  --secret       Twitter consumer secret

  --help, -h     This help
```

#### Example

```console
$ sinos-river-level-twitter -q '#RiodosSinos #NovoHamburgo from:ComusaNH' \
  --key bc254ea08faf45c216fada14d64edf71 \
  --secret 99cbd9758755f8e9e55aa2be5acb75da

Measure in Wed Dec 23 10:28:46 +0000 2015, at 7h: 2,98m
Measure in Tue Dec 22 09:51:40 +0000 2015, at 7h: 3,02m
Measure in Mon Dec 21 13:50:04 +0000 2015, at 1h: 3,15m
Measure in Fri Dec 18 10:42:48 +0000 2015, at 7h: 3,28m
Measure in Thu Dec 17 16:42:38 +0000 2015, at 3h: 3,53m
Measure in Wed Dec 16 10:08:22 +0000 2015, at 8h: 3,88m
```

### As a Node module

```javascript
var sinos = require('sinos-river-level-twitter');

//search tweets with level data
sinos.search({
  query: '#RiodosSinos #NovoHamburgo from:ComusaNH',
  key: 'bc254ea08faf45c216fada14d64edf71',
  secret: '99cbd9758755f8e9e55aa2be5acb75da'
}, function(tweets) {
  //tweets is a readable stream where every tweet emits data
  tweets.on('error', console.err);
  tweets.on('data', function(tweet) {
    console.log('Level in %s is %sm', data.tweet.created_at, data.measure.meters);
  });
});
```
