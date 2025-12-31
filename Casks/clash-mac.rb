cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.9"
  sha256 arm:   "6b7ecc16312021bbfe8c728670da82b15ed4f2f5217c9a03b3bb4746bc73ce60",
         intel: "8007328a77a2e87ff8683e91d9fed76a15a99525a0ac64e351e3745aa584acf8"

  url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-#{arch}.zip"
  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :monterey"

  app "ClashMac-v#{version}-macos-#{arch}/ClashMac.app"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    # TODO: https://github.com/666OS/ClashMac/blob/main/README.md#solutions
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end
end
