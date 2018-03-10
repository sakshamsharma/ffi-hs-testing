# library-shared-linking

## Building
```
cd golang
make shared
cd ..
stack build
```

## Running
The library needs to be in the runtime library search path. Current directory usually is in the `LD_LIBRARY_PATH`. Thus:
```
ln -sf golang/libmytest.so .
stack exec library-shared-linking-exe
```

Voila! You have a Haskell library which uses a `.so** file placed at a relative path to the build root.

### Note for Nix
If you use stack with nix integration, it will strip `pwd` from the library search path, and the above will not work. In that case, instead of `stack exec library-shared-linking-exe`, you will have to manually find the binary and run it. It may be something like (from the build root):
```
./.stack-work/install/x86_64-linux-nix/lts-10.8/8.2.2/bin/library-shared-linking-exe
```
