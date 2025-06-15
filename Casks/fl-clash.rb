cask "fl-clash" do
  version "0.8.86"

  on_arm do
    sha256 "9921b38cf6bf9d2c22893bb748f792c6932339a7906d8db51f0c50bd9f61e8fa"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "cfd733d54b3520cc5f2a38ab02d6dc06185182fafd0861e334becbd568ea45c9"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
