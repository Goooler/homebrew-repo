cask "kotlin-explorer" do
  version "1.4.2"
  sha256 "095e91ddcae5ad7d4b22a9e132da8ad77da0d793f0523e9e9510a350611c6c94"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
