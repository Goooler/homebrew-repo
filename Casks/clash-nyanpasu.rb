cask "clash-nyanpasu" do
  version "1.6.0"

  on_arm do
    sha256 "69a6a6e5ba91c8dc06992f0b26751542019b0955f3c0ff28075766ee3526badd"
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "0db4dbeb2bb5d47a2998495b18db3d8b955e9b85c61ff23b5969c801dc8e81cd"
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_x64.dmg"
  end

  name "Clash Nyanpasu"
  desc "A Clash GUI based on Tauri"
  homepage "https://github.com/libnyanpasu/clash-nyanpasu"

  app "Clash Nyanpasu.app"
end
