# here4.github.io

This repository contains the source for
[here4.github.io](http://here4.github.io/),
usually advertised as
[www.here4.io](http://www.here4.io/).

## Build locally

To view it locally, clone this repository and run make:

```
$ git clone https://github.com/here4/here4.github.io.git
$ cd here4.github.io
$ elm-install
# make
```

Then run a web server, such as:

```
$ python -m SimpleHTTPServer
```

and visit http://localhost:8000/

## Installation

This package depends on
[elm-gamepad](https://github.com/kfish/elm-gamepad).
which contains experimental Native code
and is not yet whiteliested for inclusion in the Elm package archive.
To build against elm-gamepad you will need to use an unofficial installer like
[elm-install](https://github.com/gdotdesign/elm-github-install)


## History

This app is originally based on
[elm-gamepad-tester](https://github.com/kfish/elm-gamepad-tester).

The code for this app is derived from the
[elm-mdl Dashboard example](https://github.com/vipentti/elm-mdl-dashboard)
by Ville Penttinen.

## License

MIT Licensed, see LICENSE for more details.
