# ffi-hs-testing

This repository demonstrates a possible bug in `ghc-pkg`, by showing 4 possible linking usecases, out of which the `library-archive-linking` usecase shows unexpected behavior.

This is described in much more detail [on my blog](https://sakshamsharma.com/2018/02/haskell-golang-ffi/).

Notice the `package.yaml` file in each of the 4 directories. It reveals important information about which component is linked to the library. `<dir-name>.cabal` mostly mirrors the `package.yaml` file (it is generated automatically by hpack) so you can ignore that. Please remember to `make` the appropriate type of libraries (`archive`/`shared`) in each of the folders according to the README files.
