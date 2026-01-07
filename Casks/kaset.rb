cask "kaset" do
  version "0.5.0"
  sha256 "6861607206ed69d030c398a43b3611f6caa248d482551c6b436678ab7a30adef"

  url "https://github.com/sozercan/kaset/releases/download/v#{version}/kaset-v#{version}.dmg"
  name "Kaset"
  desc "Native YouTube Music client"
  homepage "https://github.com/sozercan/kaset"

  depends_on macos: ">= :tahoe"

  app "Kaset.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/Kaset.app` for the APP, see more details in https://github.com/sozercan/kaset/blob/main/README.md#homebrew."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Kaset.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Kaset",
    "~/Library/Caches/com.kaset.imagecache",
    "~/Library/Caches/com.sertacozercan.Kaset",
    "~/Library/Preferences/com.sertacozercan.Kaset.plist",
    "~/Library/Saved Application State/com.sertacozercan.Kaset.savedState",
    "~/Library/WebKit/com.sertacozercan.Kaset",
  ]
end
