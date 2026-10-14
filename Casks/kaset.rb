cask "kaset" do
  version "0.14.2"
  sha256 "535e95f2ef3b9a8100753af94fce6acbf6f8791e3eadcae8530440a1e34232fd"

  url "https://github.com/sozercan/kaset/releases/download/v#{version}/kaset-v#{version}.dmg"
  name "Kaset"
  desc "Native YouTube Music client"
  homepage "https://github.com/sozercan/kaset"

  depends_on macos: :sequoia

  app "Kaset.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Kaset.app"]
  end

  zap trash: [
    "~/Library/Application Support/Kaset",
    "~/Library/Caches/com.kaset.imagecache",
    "~/Library/Caches/com.sertacozercan.Kaset",
    "~/Library/Preferences/com.sertacozercan.Kaset.plist",
    "~/Library/Saved Application State/com.sertacozercan.Kaset.savedState",
    "~/Library/WebKit/com.sertacozercan.Kaset",
  ]

  caveats <<~EOS
    Run `xattr -dr com.apple.quarantine /Applications/Kaset.app` for the APP, see more details in https://github.com/sozercan/kaset/blob/main/README.md#homebrew.
  EOS
end
