cask "fl-clash" do
  version "0.8.84"

  on_arm do
    sha256 "1029f3afe4c2c614ac9f461556ffccb353550a7e840ed379bfb3743e11d9732d"
    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "d1d6463482ea73f184b97c76d3ae2ba28239d33f4914b32c954b45b4be371e03"
    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free."
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
