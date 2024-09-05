cask "kotlin-explorer" do
  version "1.6.2"

  on_arm do
    sha256 "eea2e7306f8f92d37e27c9df396779c5b0c8a2d8de4dc0e3a50bf89976512816"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "040217c6b8515283bc48fb6cefa35fac7f48d80954c1a1241876aca87d8b7f6f"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
