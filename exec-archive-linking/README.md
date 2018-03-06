# exec-archive-linking

## Building
```
cd golang
make archive
cd ..
stack build
```

## Running
```
stack exec exec-archive-linking-exe
```

Voila! You have a Haskell executable which uses a `.a` file placed at a relative path to the build root.
