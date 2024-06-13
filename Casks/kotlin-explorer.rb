cask "kotlin-explorer" do
  version "1.4.3"
  sha256 "6001b8f3d25280cc95804e39bd7911b1df01e511db73266757792469804af2a2"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
