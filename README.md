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

### Steps to reproduce:

 1. Run the following commands. Ignore the `npm error` from `polymer-build`'s
    unit tests (false negative).

        npm install
        ./setup.sh
        polymer build

 2. Run `polymer build`.
 3. Observe it silently fails.
    **The expected behavior here is that the build command exits with
    a "file not found" error, and the exit code should not be `0`.**

### Environment

 * macOS Sierra 10.12
 * node 7.4.0
 * `polymer-cli` `0.18.0-alpha.9` plus `polymer-build#missing-file-handling`
    @[`df7b17c`](https://github.com/Polymer/polymer-build/pull/111/commits/df7b17cfcd516e680d15ee2a9fa5a7b7f5fa6e03)
