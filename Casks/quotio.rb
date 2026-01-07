cask "quotio" do
  version "0.6.0"
  sha256 "c9645909db45a13fdd7d9cd4f97d0efe0bb77e2d5264a031b6651cc8b1ed4179"

  url "https://github.com/nguyenphutrong/quotio/releases/download/v#{version}/Quotio-#{version}.dmg"
  name "Quotio"
  desc "Daily quotes and inspiration app"
  homepage "https://github.com/nguyenphutrong/quotio"

  deprecate! date:    "2026-01-07",
             because: "has moved to the upstream tap at https://github.com/nguyenphutrong/homebrew-tap"

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
