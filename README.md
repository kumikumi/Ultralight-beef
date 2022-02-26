# Ultralight-beef
[Ultralight](https://ultralig.ht/) bindings for the [Beef programming language](https://www.beeflang.org/). Brings Ultralight C API to Beef.

To use the library: clone this repo, then download the Ultralight SDK and extract its contents to "dist/sdk" directory. The `master` branch contains bindings for the newest release (1.2.1). Bindings for the upcoming 1.3 release are available in [1.3-dev](https://github.com/kumikumi/Ultralight-beef/tree/1.3-dev) branch.

For a working sample project, see [Ultralight-beef-samples](https://github.com/kumikumi/Ultralight-beef-samples). Contains samples for rendering a webpage to a PNG file and for incorporating an interactive HTML UI as part of an OpenGL game/application.

The bindings are (mostly) auto generated from the Ultralight C API header files.

Note: This library is currently tested and known to work on Windows and Linux. macOS support for the bindings is currently not implemented/tested. Pull requests are welcome.
