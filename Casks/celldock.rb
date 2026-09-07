cask "celldock" do
  version "0.3.1"
  sha256 "7826792510695936d2ec5f183335d51260cfb0c4f75e1a28370d90bc01abd677"

  url "https://github.com/celldock/celldock-for-mac/releases/download/#{version}/CellDock-#{version}.dmg"
  name "CellDock"
  desc "Cellular network, SMS, and calls client"
  homepage "https://github.com/celldock/celldock-for-mac"

  depends_on macos: :sonoma

  app "CellDock.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/CellDock.app"]
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
    Run `xattr -cr /Applications/CellDock.app` for the APP, see more details in https://github.com/celldock/celldock-for-mac/blob/main/README.md.
  EOS
end
