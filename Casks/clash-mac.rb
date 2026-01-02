cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.7"
  sha256 arm:   "fe5ce4b6252318edcde9d1060080ae247010b844bb6686d6f923a2269a11e91d",
         intel: "c141a66a3a227d687788474a59185a331496a9d3e2bc6213d91b43ee623a7790"

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
