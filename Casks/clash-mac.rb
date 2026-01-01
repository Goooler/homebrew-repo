cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.4"
  sha256 arm:   "f7d52b080f7427622fa2385992ec3c7b02375da472e6b0a8144af632d0b10066",
         intel: "3510c743ceaca1020fc9c28706c87922478198a59e77252c574819c3c4be4093"

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
