cask "kotlin-explorer" do
  version "1.6.3"

  on_arm do
    sha256 "131588ff7200bef4331327556c5064b1735c80601bb6885ebe179e4467d54825"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "90a664f8eff4276b2121e16120b17d46f619cc78d1d7fc0e8b7c198839ad64ff"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
