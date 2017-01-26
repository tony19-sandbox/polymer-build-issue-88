# repro for polymer-build issue 88

 1. Install `polymer-cli` that includes `polymer-build#missing-file-handling`.
 2. Run `polymer build`.
 3. Observe it silently fails and does not print `"Build complete!"`.
 4. Delete `images/*.png`.
 5. Rebuild.
 6. Observe the build correctly errors out, indicating nonexistent files. (Is there a premature exit?)

### Environment

 * macOS Sierra 10.12
 * node 7.4.0
 * `polymer-cli` (`master` branch @[`0f2720e`](https://github.com/Polymer/polymer-cli/commit/0f2720e)), with dependency on [`tony19-contrib/polymer-build#dist-missing-file-handling`](https://github.com/tony19-contrib/polymer-build/commit/848526a14f095842675da568142f6c7267ef8387) (a build of `polymer-build` `missing-file-handling` branch @[`52205d6`](https://github.com/Polymer/polymer-build/commit/52205d64a0ef26fd0403f6b6a6b8aee10cbeccdc))
