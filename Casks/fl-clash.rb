cask "fl-clash" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.3"
  sha256 arm:   "980e9cc3bd47d2090876e5e3c06f774e32a89330d83aa66ac3f8490e39924d9b",
         intel: "9738eebec4c8dd017bebb608f2d1e8c209cf5aa97cc4f181783036b66dd3c944"

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
