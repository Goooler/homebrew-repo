cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.12"
  sha256 arm:   "abf1c3cc273918eb40e225b9d13b21259d72fa4cec288fecca41734290cdc5c8",
         intel: "c700aab8377e5924ab5615ce4253eb42927d67027c1537a71c8494fa642d46a5"

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
