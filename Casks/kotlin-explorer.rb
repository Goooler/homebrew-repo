cask "kotlin-explorer" do
  version "1.4.0"
  sha256 "18f671a9dedc697de4769fbd6d0f326efe6a6e7d115541fd8e6c8a99218c7368"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
