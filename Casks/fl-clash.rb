cask "fl-clash" do
  version "0.8.88"

  on_arm do
    sha256 "1f60e382ebd0d8fde8a64cc95cb78ba0d4282112a0a1ccbf103c99be9aeb4d62"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-arm64.dmg"
  end
  on_intel do
    sha256 "bbc4121a9692329cb43c6286a3fa67248279a64d812f801afcac9ce20fd54c11"

    url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-amd64.dmg"
  end

  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  app "FlClash.app"
end
