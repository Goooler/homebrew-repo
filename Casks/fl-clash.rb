cask "fl-clash" do
  version "0.8.90"

  on_arm do
    sha256 "0415c9c5734c3d8474da11fd2cf3a75c7822b5a8fbaa031dfb9e47c8aa25a2a7"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "a6e753046aee63bb88d3355996a944ee98059883074379a254bd87ca1459ef42"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
