cask "quotio" do
  version "0.5.0"
  sha256 "bb2abba5895c3f69b51de74cd99744a31de0eefac3994ae937974acb102e25af"

  url "https://github.com/nguyenphutrong/quotio/releases/download/v#{version}/Quotio-#{version}.dmg"
  name "Quotio"
  desc "Daily quotes and inspiration app"
  homepage "https://github.com/nguyenphutrong/quotio"

  depends_on macos: ">= :sequoia"

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
    "~/Library/Preferences/proseek.io.vn.Quotio.plist",
    "~/Library/Saved Application State/com.nguyenphutrong.quotio.savedState",
    "~/Library/WebKit/com.nguyenphutrong.quotio",
  ]
end
