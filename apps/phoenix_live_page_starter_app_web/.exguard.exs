use ExGuard.Config

guard("tests", run_on_start: true)
|> command("mix test --color")
|> watch(
  {~r{test/(?<dir>.+)/(?<file>.+)_test.exs$}i,
   fn m -> "test/#{m["dir"]}/#{m["file"]}_test.exs" end}
)
|> watch(
  {~r{lib/(?<dir>.+)/(?<file>.+).ex$}i, fn m -> "test/#{m["dir"]}/#{m["file"]}_test.exs" end}
)
|> watch(~r{\.(erl|ex|exs|eex|xrl|yrl)\z}i)
|> ignore(~r{(assets|priv)})
|> notification(:off)
