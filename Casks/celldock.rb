cask "celldock" do
  version "0.3.0"
  sha256 "27335c3476d1ec54dd89fd87ec59a9a83fa5649db9a42096388e5b814c31a1aa"

  url "https://github.com/celldock/celldock-for-mac/releases/download/#{version}/CellDock-#{version}-universal.dmg"
  name "CellDock"
  desc "Cellular network, SMS, and calls client"
  homepage "https://github.com/celldock/celldock-for-mac"

  depends_on macos: :sonoma

  app "CellDock.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/CellDock.app` for the APP, see more details in https://github.com/celldock/celldock-for-mac/blob/main/README.md."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/CellDock.app"], sudo: false
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
end
