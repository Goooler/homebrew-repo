cask "quotio" do
  version "0.4.4"
  sha256 "753161726375b9b4aa11595ab584227f026c2417c7cd6cfc80e95994e945de7f"

  url "https://github.com/nguyenphutrong/quotio/releases/download/v#{version}/Quotio-#{version}.dmg"
  name "Quotio"
  desc "Daily quotes and inspiration app"
  homepage "https://github.com/nguyenphutrong/quotio"

  app "Quotio.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/Quotio.app` for the APP, see more details in https://github.com/nguyenphutrong/quotio/blob/master/README.md#download."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Quotio.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Quotio",
    "~/Library/Caches/com.nguyenphutrong.quotio",
    "~/Library/Preferences/com.nguyenphutrong.quotio.plist",
    "~/Library/Saved Application State/com.nguyenphutrong.quotio.savedState",
    "~/Library/WebKit/com.nguyenphutrong.quotio",
  ]
end
