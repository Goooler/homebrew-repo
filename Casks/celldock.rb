cask "celldock" do
  version "0.3.4"
  sha256 "f288db88956f905e07374ca99618dcbdcd72d9f79f5007215adc97b4464e52ef"

  url "https://github.com/celldock/celldock-for-mac/releases/download/#{version}/CellDock-#{version}.dmg"
  name "CellDock"
  desc "Cellular network, SMS, and calls client"
  homepage "https://github.com/celldock/celldock-for-mac"

  depends_on macos: :sonoma

  app "CellDock.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/CellDock.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.celldock.mac",
    "~/Library/Application Support/CellDock",
    "~/Library/Caches/app.celldock.mac",
    "~/Library/HTTPStorages/app.celldock.mac",
    "~/Library/Preferences/app.celldock.mac.plist",
    "~/Library/Saved Application State/app.celldock.mac.savedState",
    "~/Library/WebKit/app.celldock.mac",
  ]

  caveats <<~EOS
    Run `xattr -dr com.apple.quarantine /Applications/CellDock.app` for the APP, see more details in https://github.com/celldock/celldock-for-mac/blob/main/README.md.
  EOS
end
