# repro for polymer-build issue 88 [![Build Status](https://travis-ci.org/tony19-sandbox/polymer-build-issue-88.svg?branch=master)](https://travis-ci.org/tony19-sandbox/polymer-build-issue-88)

This project demonstrates `polymer-build` [issue 88](https://github.com/Polymer/polymer-build/issues/88),
where it silently fails when an HTML import points to a non-existent
file that sits in the source root (possibly other locations). For
example:

*Directory Tree*:

    .
    ├── src
    │   ├── my-icons.html


`my-icons.html`:

    <link rel="import" href="bower_components/nonexistent.html">

[polymer-build PR#111](https://github.com/Polymer/polymer-build/pull/111)
fixes the simple case above, but the bug still manifests in more complex
scenarios, such as the one in this repo.

### Steps to reproduce

 1. Run the following commands.

        npm install
        polymer build

 2. Observe it silently fails like this:

        $ polymer build 
        warn:    "sourceGlobs" config option has been renamed to "sources" and will no longer be supported in future versions
        warn:    "includeDependencies" config option has been renamed to "extraDependencies" and will no longer be supported in future versions
        info:    Preparing build...
        info:    Building application...
        info:    Generating build/unbundled...
        info:    Generating build/bundled...
        $

    *The expected behavior here is that the build command exits with
    a "file not found" error, and the exit code should not be `0`.*


A similar failure occurs when using the `gulpfile.js` (which uses
`polymer-build` from Gulp) from `generator-polymer-init-custom-build`.

 3. Run `gulp build`.

 4. Observe it silently fails like this:

        $ gulp build
        warn:    "sourceGlobs" config option has been renamed to "sources" and will no longer be supported in future versions
        warn:    "includeDependencies" config option has been renamed to "extraDependencies" and will no longer be supported in future versions
        [00:03:50] Using gulpfile ~/src/polymer-build-issue-88/gulpfile.js
        [00:03:50] Starting 'build'...
        Deleting build directory...
        Analyzing build dependencies...
        $

### Environment

 * macOS Sierra 10.12
 * node 7.4.0
 * `polymer-cli` `0.18.0-alpha.9`
