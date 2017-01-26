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
 * `polymer-cli` (master branch @0f2720e), with dependency on `tony19-contrib/polymer-build#dist-missing-file-handling`