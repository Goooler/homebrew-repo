cask "mihomo-sparkle" do
  version "1.6.9"

  on_arm do
    sha256 "b033d61ce7c96f81ee7663cb2864aea17073e18fa3406fa9e527e6eb33c831b9"
    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"
    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 "e9bd21d47dca4a719e6b8363d3cbf183c4803d89421ced312f9cc298bb4e03f6"
    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-x64.pkg"
    pkg "sparkle-macos-#{version}-x64.pkg"
  end

  name "Sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  uninstall pkgutil: "com.xishang0128.sparkle"
end
