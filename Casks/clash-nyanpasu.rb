cask "clash-nyanpasu" do
  version "1.6.0"

  on_arm do
    sha256 "69a6a6e5ba91c8dc06992f0b26751542019b0955f3c0ff28075766ee3526badd"
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "2f1e8d773097c1c61ffa0d1be6c4cbfa9a2d71745cc0d9ac8ed5215a4267b7a4"
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_x64.dmg"
  end

  name "Clash Nyanpasu"
  desc "A Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  app "Clash Nyanpasu.app"
end
