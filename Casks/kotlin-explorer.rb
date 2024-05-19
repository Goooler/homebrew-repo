cask "kotlin-explorer" do
  version "1.2.0"
  sha256 "5af955fa83874f254cede4593833b02ae3e32bb96e3115c2a1029893130ba667"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/Kotlin.Explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Kotlin Explorer is a desktop tool to quickly and easily disassemble Kotlin code."
  homepage "https://github.com/romainguy/kotlin-explorer"

  auto_updates true

  app "Kotlin Explorer.app"
end
