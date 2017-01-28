# repro for polymer-build issue 88

This project demonstrates `polymer-build` [issue 88](https://github.com/Polymer/polymer-build/issues/88),
where it silently fails when an HTML import points to a non-existent
file that sits in the source root (possibly other locations). For
example:

*Directory Tree*:

    .
    ├── src
    │   ├── my-icons.html


`my-icons.html`:

    <link rel="import" href="../nonexistent.html">

[polymer-build PR#111](https://github.com/Polymer/polymer-build/pull/111)
fixes the simple case above, but the bug still manifests in more complex
scenarios, such as the one in this repo.

### Steps to reproduce:

 1. Run `npm install` on this repo (**NOTE:** don't use `yarn` here
    because it [doesn't handle GitHub branches properly](https://github.com/yarnpkg/yarn/issues/2572)).
 2. Run `polymer build`.
 3. Observe it silently fails.
    **The expected behavior here is that the build command exits with
    a "file not found" error, and the exit code should not be `0`.**

The interesting thing is removing some files somehow allows `polymer-build`
to emit the "file not found" errors:

 4. Do **one** of the following:
   * Delete `images/*.png`.
   * Delete `src/ost-carousel/`.
   * Delete `src/search-box/` AND `src/view*`
 5. Rebuild with `polymer build`.
 6. Observe the build correctly errors out, indicating nonexistent files.

### Environment

 * macOS Sierra 10.12
 * node 7.4.0
 * `polymer-cli`
  - `0.17.0`
  - `0.18.0-alpha.8`
  - `tony19-contrib/polymer-cli#missing-file-handling`
    * This is [`0.18.0-alpha.9`](https://github.com/Polymer/polymer-cli/commit/c231a2c813f532bd871c298c13adf5b38497153e)
    plus `polymer-build#missing-file-handling`
    @[`df7b17c`](https://github.com/Polymer/polymer-build/pull/111/commits/df7b17cfcd516e680d15ee2a9fa5a7b7f5fa6e03)
