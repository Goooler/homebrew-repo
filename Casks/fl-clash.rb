cask "fl-clash" do
  version "0.8.89"

  on_arm do
    sha256 "7ff917a1e73ba2b3551cf4983d17236e6bff73f65f95748868463983fc9d40b4"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "65bc4732978af845eae41070d27ce5723d6dd45226c74d13681cd3bea5ee40d7"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
