cask "fl-clash" do
  version "0.8.91"

  on_arm do
    sha256 "8992e53920948d0f19ed775d43c4b75a726d8dc5b7d5cb82d8dce27e5d1d98fd"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "09ac542184ca591e3a2d595ff2b798313e3245119576923c836c11754ca43264"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"
  release_url "https://github.com/chen08209/FlClash/releases/tag/v#{version}"

  app "FlClash.app"
end
