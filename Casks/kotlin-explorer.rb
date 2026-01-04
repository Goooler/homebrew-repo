cask "kotlin-explorer" do
  arch arm: "arm64", intel: "x64"

  version "1.6.6"
  sha256 arm:   "ec7a3e74b9abc475c75f0fbca4f0bd7fef864e41d9f110061e79dc21434059e7",
         intel: "8687415794c00d65af4d7262d4b07deb82e747121d77d0c6172df93eb60f7fb4"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-#{arch}-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"

  zap trash: [
    "~/Library/Application Support/Kotlin Explorer",
    "~/Library/Caches/com.romainguy.kotlin-explorer",
    "~/Library/Preferences/com.romainguy.kotlin-explorer.plist",
    "~/Library/Saved Application State/com.romainguy.kotlin-explorer.savedState",
  ]
end
