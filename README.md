# MapSet.Typing

My goal is to make the tests compile, ~~and the Dialyzer check pass without
suppressing its warnings~~ having fixed\* the typespecs:

```bash
mix deps.get && \
mix deps.compile && \
mix compile && \
mix test
```

For now, I'm getting:

```plain
$ mix test

== Compilation error in file test/map_set/typing_test.exs ==
** (CompileError) test/map_set/typing_test.exs:24: undefined function whitelisted?/1
…
```
