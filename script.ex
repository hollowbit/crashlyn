defmodule Crashlyn do

	def generate(word) do
		cond do
			String.ends_with?(word, "assion") ->
				[beginning | _] = String.split(word, "ass")
				beginning <> "ashlyn"
			String.ends_with?(word, "tion") ->
				[beginning | _] = String.split(word, "tion")
				beginning <> "shlyn"
			String.ends_with?(word, "ash") ->
				word <> "lyn"
			String.ends_with?(word, "shion") ->
				[beginning | _] = String.split(word, "shion")
				beginning <> "shlyn"
			String.ends_with?(word, "atch") ->
				[beginning | _] = String.split(word, "atch")
				beginning <> "atchlyn"
			String.ends_with?(word, "otch") ->
				[beginning | _] = String.split(word, "otch")
				beginning <> "otchlyn"
			String.ends_with?(word, "och") ->
				[beginning | _] = String.split(word, "och")
				beginning <> "ochlyn"
			String.ends_with?(word, "osh") ->
				word <> "lyn"
			true ->
				word <> "shlyn"
		end
	end

end

{:ok, text} = File.read("words.txt")

list = text |> String.split("\n") |> Enum.filter(fn word -> String.ends_with?(word, ["assion","tion","ash","shion","atch", "osh", "otch", "och"]) end) |> Enum.map( fn word -> Crashlyn.generate(word) <> " (" <> word <> ")" <> "\n" end)

{:ok, file} = File.open "ashlyn_nicknames.txt", [:append]
Enum.each list, &(IO.binwrite(file, &1))
File.close file
