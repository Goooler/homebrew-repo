cask 'clash-nyanpasu' do
  version '1.6.1'

  on_arm do
    sha256 'bcee837286a58eb786230115d53a0f69448b22cc126621b811cb147f98f03034'
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 'a4d4ff4e9fbe7ab1a73e151451f0b8b599dd97702e9d5706bb08c2d962bceeac'
    url "https://github.com/libnyanpasu/clash-nyanpasu/releases/download/v#{version}/Clash.Nyanpasu_#{version}_x64.dmg"
  end

  name 'Clash Nyanpasu'
  desc 'Clash GUI based on Tauri'
  homepage 'https://github.com/libnyanpasu/clash-nyanpasu'

  app 'Clash Nyanpasu.app'
end
