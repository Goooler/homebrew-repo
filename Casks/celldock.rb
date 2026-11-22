cask "celldock" do
  version "0.3.3"
  sha256 "a2e8be7215abf3bc92befb78ef5e78a12662fec2c4f204e50fec1a5797c49693"

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
