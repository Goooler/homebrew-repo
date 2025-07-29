cask "fl-clash" do
  version "0.8.87"

  on_arm do
    sha256 "e7127285f6aeb7d717820abdc98409a5313fa49e1242f99c925229b56cd7c5be"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "1f3694f926004571aa658e5680c250d828bcb58192c4b2ee8cd717aca924163f"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
