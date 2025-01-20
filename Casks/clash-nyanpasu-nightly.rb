cask "clash-nyanpasu-nightly" do
  version "2.0.0-alpha+aaf84fb"

  on_arm do
    sha256 "88a3046314d03ec6039200e5df2a4ce6422c9a3974019092868d59d7235bd34a"
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "d82d31294840e2726ac2bce540a91151e441a30e167b0f8d80af2e7ebe148940"
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/pre-release/Clash.Nyanpasu_#{version}_x64.dmg"
  end

  name "Clash Nyanpasu Nightly"
  desc "Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  app "Clash Nyanpasu.app", target: "Clash Nyanpasu Nightly.app"
end
