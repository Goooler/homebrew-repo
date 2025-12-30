cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.5"
  sha256 arm:   "0410b366e10cb9172bf90366f6393c6ee9cad25a2efb1d9abec7ae253f645fd2",
         intel: "1dc12dc599d5e899c2e9c3dc8821c4e5c13b9c6fafadc86cd2ca19ca22a1cc06"

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
