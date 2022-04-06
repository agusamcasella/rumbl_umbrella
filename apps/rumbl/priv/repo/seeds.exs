# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rumbl.Repo.insert!(%Rumbl.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rumbl.Multimedia

for category <- ~w(Action Drama Romance Comedi Sci-fi) do
  Multimedia.create_category!(category)
end

# inssertar en todos videos usuario id 1
# en conflicto nada..
videos =
  Video
  |> where([v], is_nil(v.user_id))
  |> Repo.update_all(set: [user_id: 1])

videos =
  Video
  |> where([v], is_nil(v.category_id))
  |> Repo.update_all(set: [category_id: 7])
