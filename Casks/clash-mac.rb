cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.3.3"
  sha256 arm:   "db9c5a740b1a69090a84fca068151acb237f8278ef5a9800af041fc110e28f3d",
         intel: "1243660eac21c200ad593f88288934f85d0ecf95195aca30d7d54b5823b77644"

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
