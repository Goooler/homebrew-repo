cask "ec25-toolbox" do
  version "27.1"
  sha256 "ce72413b51d2c2801f0e5289915129f81562bdf8391629adf1abda642efc3573"

  url "https://github.com/skyrocketingHong/EC25Toolbox/releases/download/#{version}/EC25-Toolbox-#{version}-arm64.dmg"
  name "EC25 Toolbox"
  desc "Control center for EC25-class cellular modems"
  homepage "https://github.com/skyrocketingHong/EC25Toolbox"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "EC25 Toolbox.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/EC25 Toolbox.app"]
  end

  uninstall launchctl: [
    "ing.fuyaoskyrocket.ec25toolbox.ike-helper",
    "ing.fuyaoskyrocket.ec25toolbox.system-helper",
  ]

  zap trash: [
    "~/Library/Application Support/ing.fuyaoskyrocket.ec25toolbox",
    "~/Library/Caches/ing.fuyaoskyrocket.ec25toolbox",
    "~/Library/Preferences/ing.fuyaoskyrocket.ec25toolbox.plist",
    "~/Library/Saved Application State/ing.fuyaoskyrocket.ec25toolbox.savedState",
  ]

  caveats <<~EOS
    Run `xattr -dr com.apple.quarantine "/Applications/EC25 Toolbox.app"` for the APP, see more details in https://github.com/skyrocketingHong/EC25Toolbox.
  EOS
end
