cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.7"
  sha256 arm:   "afd3e6c91460cdc40c03ca3f46af68650e625b3e45644a336de1e6914ca2d7bf",
         intel: "f44017ba452ed1b0f7e79d32070e197ac5331471569610de445f19268afc4fb8"

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
