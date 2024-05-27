cask "kotlin-explorer" do
  version "1.2.2"
  sha256 "2781f1718cb7d0f317c50f8ae6f617ef73cf5d827d45499e94277d91f7c1e4e6"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/Kotlin.Explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Kotlin Explorer is a desktop tool to quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
