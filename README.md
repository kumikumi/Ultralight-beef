# Ultralight-beef
[Ultralight](https://ultralig.ht/) bindings for the [Beef programming language](https://www.beeflang.org/). Brings Ultralight C API to Beef.

To use the library: clone this repo, then download the Ultralight SDK and extract its contents to "dist/sdk" directory.

For a working sample project, see [Ultralight-beef-samples](https://github.com/kumikumi/Ultralight-beef-samples). Contains samples for rendering a webpage to a PNG file and for incorporating an interactive HTML UI as part of an OpenGL game/application.

Note: Currently the main focus of the bindings is Glfw/OpenGL integration, and therefore AppCore API is mostly not implemented, except for a few necessary functions. Pull requests are welcome.
