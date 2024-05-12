cask "kotlin-explorer" do
  version "1.0.1"
  sha256 "52a0c0612eaca020e28ff59f944aa16961367e95c6f5fa99f36d7a1bd45c071a"

  # TODO: the path should be updated to "romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  url "https://github.com/romainguy/kotlin-explorer/releases/download/v1.0.0/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Kotlin Explorer is a desktop tool to quickly and easily disassemble Kotlin code into: Java bytecode, Android DEX bytecode, and Android OAT assembly."
  homepage "https://github.com/romainguy/kotlin-explorer"

  auto_updates true
  depends_on "openjdk"
  depends_on "kotlin"

  app "Kotlin Explorer.app"
end