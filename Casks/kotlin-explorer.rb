cask "kotlin-explorer" do
  version "1.3.0"
  sha256 "e5292252bd12c698ef93b184fe2a93aa97f4668e6d52d7a6c4e24902685a963e"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Desktop tool to quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
