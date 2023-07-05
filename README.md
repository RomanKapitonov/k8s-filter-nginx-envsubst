## Run

```sh
docker-compose build --no-cache && docker-compose up
```

Awk does not support negative lookahead. There is not way to blacklist the env vars because of this line:

```sh
defined_envs=$(printf '${%s} ' $(awk "END { for (name in ENVIRON) { print ( name ~ /${filter}/ ) ? name : \"\" } }" < /dev/null ))
```

It could be done by changing `( name ~ /${filter}/ )` to `( name !~ /${filter}/ )`:

```sh
defined_envs=$(printf '${%s} ' $(awk "END { for (name in ENVIRON) { print ( name !~ /${filter}/ ) ? name : \"\" } }" < /dev/null ))
```
