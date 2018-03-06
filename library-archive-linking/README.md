# library-archive-linking
Demonstrates a possible bug in `ghc-pkg`.

## Building
```
cd golang
make archive
cd ..
stack build
```

This will not build. `ghc-pkg` (AFAIK) believes linking libraries to `.a` archives (placed at relative paths** is sacrilege.

**To make this work** you need to edit `package.yaml` for this project. Observe line 27 (`extra-lib-dirs: golang`). Change it to the absolute path of the golang directory (it must have the built `libmytest.a` file).

Now, `stack build` will work fine.

## Running
```
stack exec library-archive-linking-exe
```

Voila! You have a Haskell library which uses a `.a` file placed at an absolute (:sad:) location. This library is linked statically, so there is no need to have it in the path during runs.
