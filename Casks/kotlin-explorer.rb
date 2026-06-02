cask "kotlin-explorer" do
  arch arm: "arm64", intel: "x64"

  version "1.6.7"
  sha256 arm:   "a59f790d705764c07f55d839104cbfd5cef61b2194ccaeff46aa22490ff04e63",
         intel: "0b59656ce42e1af4c2ed4ef1d01f79d4891a970533c58254de4c1bec508ff845"

  url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-macos-#{arch}-#{version}.dmg"
  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  depends_on :macos

  app "Kotlin Explorer.app"

  zap trash: [
    "~/Library/Caches/dev.romainguy.kotlin.explorer",
    "~/Library/Preferences/dev.romainguy.kotlin.explorer.plist",
    "~/Library/Saved Application State/dev.romainguy.kotlin.explorer.savedState",
  ]
end
