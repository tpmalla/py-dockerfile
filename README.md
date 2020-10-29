# Creating a more efficient python image

## Passing git commit hash

#### this will work on bash but not on 🐟

```
export GIT_HASH=$(git rev-parse HEAD)
docker build --build-arg GIT_HASH=${GIT_HASH::7} -t movie-app .
#zsh> docker build --build-arg GIT_HASH=${GIT_HASH[1,7]} -t movie-app .
docker run --rm movie-app env | grep GIT_HASH
GIT_HASH=6a78e6b
```
