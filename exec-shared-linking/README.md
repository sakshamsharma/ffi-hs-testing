# exec-shared-linking

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
stack exec exec-shared-linking-exe
```

Voila! You have a Haskell executable which uses a `.so` file placed at a relative path to the build root.
