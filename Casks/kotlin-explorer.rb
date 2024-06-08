cask "kotlin-explorer" do
  version "1.4.2"
  sha256 "f2034213df7ab4e426348d6b20667a5f02732d9a892dd770e3a4b68f9ba8d4da"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
