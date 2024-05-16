cask "kotlin-explorer" do
  version "1.1.0"
  sha256 "51820eee6d61ad6179f3ad16db86544799e179d9314e52b82c7ae70ee13b1457"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Kotlin Explorer is a desktop tool to quickly and easily disassemble Kotlin code into: Java bytecode, Android DEX bytecode, and Android OAT assembly."
  homepage "https://github.com/romainguy/kotlin-explorer"

  auto_updates true

  app "Kotlin Explorer.app"
end
