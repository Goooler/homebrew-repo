cask "kaset-fork" do
  version "0.3.0"
  sha256 "b165ea9212854858b81945defb22fe051bbd020e5a651230870e040131f0d8d3"

  url "https://github.com/notnotrachit/kaset/releases/download/v#{version}%28MacOS-15%29/Kaset.dmg"
  name "Kaset Fork"
  desc "Native YouTube Music client (fork)"
  homepage "https://github.com/notnotrachit/kaset"

  depends_on macos: ">= :sequoia"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+)\(MacOS-\d+\)$/i)
  end

  app "Kaset.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/Kaset.app` for the APP, see more details in https://github.com/sozercan/kaset/blob/main/README.md#homebrew."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Kaset.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Kaset",
    "~/Library/Caches/com.sertacozercan.Kaset",
    "~/Library/Preferences/com.sertacozercan.Kaset.plist",
    "~/Library/Saved Application State/com.sertacozercan.Kaset.savedState",
    "~/Library/WebKit/com.sertacozercan.Kaset",
  ]
end
