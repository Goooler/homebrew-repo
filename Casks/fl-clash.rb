cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.1"
  sha256 arm:   "ef904fb991a9ed5f0deaedb0a66f4a45dccfceeb45225d602fad3f2246aa9b99",
         intel: "01bf8bc434a7f035fe2c27736f061c3cb7721e63771000277711840dde0d5219"

  url "https://github.com/chen08209/FlClash/releases/download/v#{version}/FlClash-#{version}-macos-#{arch}.dmg"
  name "FlClash"
  desc "Multi-platform proxy client based on ClashMeta"
  homepage "https://github.com/chen08209/FlClash"

  # Exclude pre-releases like v0.8.92-pre.1
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "FlClash.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/FlClash.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.follow.clash",
    "~/Library/Caches/com.follow.clash",
    "~/Library/Logs/com.follow.clash",
    "~/Library/Preferences/com.follow.clash.plist",
    "~/Library/Saved Application State/com.follow.clash.savedState",
    "~/Library/WebKit/com.follow.clash",
  ]

  caveats <<~EOS
    Run `xattr -dr com.apple.quarantine /Applications/FlClash.app` for the APP, see more details in https://github.com/chen08209/FlClash.
  EOS
end
