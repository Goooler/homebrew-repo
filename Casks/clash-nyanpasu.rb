cask "clash-nyanpasu" do
  version "1.6.0"

  on_arm do
    sha256 "916c4dbcb3e650898f85556c4a6e6c0628788139163c47a8e46c51ad099aa619"
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
