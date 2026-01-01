cask "kaset-fork" do
  version "0.3.0"
  sha256 "96ae05bb967ce0875b4312a12ebfc892ae6aedcddfbca7f54ce34ef991957519"

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
    "~/Library/Caches/com.sertacozercan.Kaset",
    "~/Library/Preferences/com.sertacozercan.Kaset.plist",
    "~/Library/Saved Application State/com.sertacozercan.Kaset.savedState",
    "~/Library/WebKit/com.sertacozercan.Kaset",
  ]
end
