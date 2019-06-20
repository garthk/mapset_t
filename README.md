# MapSet.Typing

My goal is to make the tests compile, and the Dialyzer check pass without
suppressing its warnings:

```bash
mix deps.get && \
mix deps.compile && \
mix compile && \
mix test && \
rm -f dialyzer.ignore-warnings && \
touch dialyzer.ignore-warnings && \
mix dialyzer --format dialyzer
```

For now, I'm getting:

```plain
$ mix test

== Compilation error in file test/map_set/typing_test.exs ==
** (CompileError) test/map_set/typing_test.exs:24: undefined function whitelisted?/1
…
```

And:

```
$ mix dialyzer --format dialyzer
…
lib/map_set/typing.ex:38: The call 'Elixir.MapSet':'member?'
         (#{'__struct__' := 'Elixir.MapSet',
            'map' := #{<<_:56, _:_*8>> => []},
            'version' := 2},
          binary()) does not have an opaque term of type
          'Elixir.MapSet':t(_) as 1st argument
lib/map_set/typing.ex:42: The specification for 'Elixir.MapSet.Typing':whitelisted_keys/0 has an opaque subtype
          'Elixir.MapSet':t(_) which is violated by the success typing
          () ->
             #{'__struct__' := 'Elixir.MapSet',
               'map' := #{<<_:56, _:_*8>> => []},
               'version' := 2}
done (warnings were emitted)
```
