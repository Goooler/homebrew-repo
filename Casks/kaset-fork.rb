cask "kaset-fork" do
  version "0.4.1"
  sha256 "79dbee09c28c9955ac6d47d22b94c3f9342e42b94edad236b31744f0e18ce1f6"

  url "https://github.com/Goooler/kaset/releases/download/v#{version}/kaset-v#{version}.dmg"
  name "Kaset Fork"
  desc "Native YouTube Music client (fork)"
  homepage "https://github.com/notnotrachit/kaset"

  depends_on macos: ">= :sequoia"

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
