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

Bom dia! Nível do #RiodosSinos em #NovoHamburgo às 7h de hoje: 2,98m @PMNH
Bom dia! Nível do #RiodosSinos em #NovoHamburgo às 7h de hoje: 3,02m @PMNH
Bom dia! Nível do #RiodosSinos em #NovoHamburgo às 11h de hoje: 3,15m @PMNH
Bom dia! Nível do #RiodosSinos em #NovoHamburgo às 7h de hoje: 3,28m @PMNH
Bom dia! Nível do #RiodosSinos em #NovoHamburgo às 13h de hoje: 3,53m @PMNH
Bom dia! Nível do #RiodosSinos em #NovoHamburgo às 8h de hoje: 3,88m @PMNH
```
