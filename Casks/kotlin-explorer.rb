cask "kotlin-explorer" do
  version "1.6.6"

  on_arm do
    sha256 "ec7a3e74b9abc475c75f0fbca4f0bd7fef864e41d9f110061e79dc21434059e7"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "8687415794c00d65af4d7262d4b07deb82e747121d77d0c6172df93eb60f7fb4"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
