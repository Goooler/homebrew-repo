cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.5"
  sha256 arm:   "33bb16bc47a798a226321287d0450c38b974c835ff3b02bbcec553fdfd327188",
         intel: "63df77b6e3000f5202e323ed79b0b0e6cd0d8d459a2f9894cede7bfef700e65e"

  url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-#{arch}.zip"
  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :monterey"

  app "ClashMac-v#{version}-macos-#{arch}/ClashMac.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end
end
