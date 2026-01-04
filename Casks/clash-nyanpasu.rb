cask "clash-nyanpasu" do
  arch arm: "aarch64", intel: "x64"

  version "1.6.1"
  sha256 arm:   "bcee837286a58eb786230115d53a0f69448b22cc126621b811cb147f98f03034",
         intel: "a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac"

  url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_#{arch}.dmg"
  name "Clash Nyanpasu"
  desc "Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  app "Clash Nyanpasu.app"

  zap trash: [
    "~/Library/Application Support/com.libnyanpasu.clash-nyanpasu",
    "~/Library/Caches/com.libnyanpasu.clash-nyanpasu",
    "~/Library/Logs/com.libnyanpasu.clash-nyanpasu",
    "~/Library/Preferences/com.libnyanpasu.clash-nyanpasu.plist",
    "~/Library/Saved Application State/com.libnyanpasu.clash-nyanpasu.savedState",
    "~/Library/WebKit/com.libnyanpasu.clash-nyanpasu",
  ]
end
