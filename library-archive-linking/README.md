# library-archive-linking
Demonstrates a possible bug in `ghc-pkg`.

## Building
```
cd golang
make archive
cd ..
stack build
```

This will not build. `ghc-pkg` (AFAIK) believes linking libraries to `.a` archives (placed at relative paths) is sacrilege. It does not complain about this error if you try to make an executable depend on an archive at a relative location. Also, the error only seems to be valid for dynamic linking, and seems to ignore static linking usecases.

The actual error is:
```
library-archive-linking-0.1.0.0: library-dirs: golang is a relative path which
makes no sense (as there is nothing for it to be relative to). You can make
paths relative to the package database itself by using ${pkgroot}. (use
--force to override)
library-archive-linking-0.1.0.0: dynamic-library-dirs: golang is a relative
path which makes no sense (as there is nothing for it to be relative to). You
can make paths relative to the package database itself by using ${pkgroot}.
(use --force to override)
```

`${pkgroot}` or `--force` do not seem to be concepts understood by stack/cabal. (The error is from `ghc-pkg` as verified independently).

**To make this work** you need to edit `package.yaml` for this project. Observe line 27 (`extra-lib-dirs: golang`). Change it to the absolute path of the golang directory (it must have the built `libmytest.a` file).

Now, `stack build` will work fine.

## Running
```
stack exec library-archive-linking-exe
```

Voila! You have a Haskell library which uses a `.a` file placed at an absolute (:sad:) location. This library is linked statically, so there is no need to have it in the path during runs.

## Interesting behavior inside a Nix shell
If you use `nix`, you can do the following to build this:
```
nix-shell shell.nix
> runhaskell Setup.hs configure
> runhaskell Setup.hs build
```

Interestingly, the same commands on my Ubuntu system did not work, although it had an older version of `ghc` as compared to the one inside the nix-shell. Similarly, building with `nix** works as well.

**Note**: The nix shell file was generated as follows:
```
nix-shell -p cabal2nix --command 'cabal2nix . --shell > shell.nix'
```
Then, I had to remove both occurances of `mytest` from `shell.nix`.
