cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.2"
  sha256 arm:   "216f71773b70941afe3f6d1df6f21df05810e109bb8075f44560a0349e66e0d2",
         intel: "e545c5539c631c0116e9d58a04b3fb95ce587304616e85489ba15a54e8c7eb70"

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
