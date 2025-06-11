cask "fl-clash" do
  version "0.8.85"

  on_arm do
    sha256 "39db2244b4c5e30cd57747c069622d8237725c5e6edd6c4ac977d1c5c0c293f9"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "01cd5adbb32ae6c5e9c7b86a6867493446d05c6e1b8df68cde2d539462aa13e7"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
