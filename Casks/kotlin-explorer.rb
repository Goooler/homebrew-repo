cask "kotlin-explorer" do
  version "1.6.5"

  on_arm do
    sha256 "916c4dbcb3e650898f85556c4a6e6c0628788139163c47a8e46c51ad099aa619"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "0db4dbeb2bb5d47a2998495b18db3d8b955e9b85c61ff23b5969c801dc8e81cd"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
