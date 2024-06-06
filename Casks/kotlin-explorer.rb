cask "kotlin-explorer" do
  version "1.3.1"
  sha256 "e1da70b866766e659f268338a21462fbf04d4e9fc2bb55613eca9a2dac1a4b6b"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
