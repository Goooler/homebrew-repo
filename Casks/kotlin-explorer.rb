cask "kotlin-explorer" do
  version "1.4.1"
  sha256 "27d92424659895f717e09abff4c6d5615609046daf9afdee10546b40cb44f513"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
