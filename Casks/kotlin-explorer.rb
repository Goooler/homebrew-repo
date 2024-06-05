cask "kotlin-explorer" do
  version "1.2.3"
  sha256 "5d1b733f24fde502a752987c417376483c496cb02f69c002499337f4bffc25dc"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "A desktop tool to quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
