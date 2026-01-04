cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.20"
  sha256 arm:   "2f1b1e29ce9526251f744b87b0c32a64f32aa4e449ddd178f9345d332e003abf",
         intel: "99e4580c0e855efbdf1b786f6fb5ce452a05a519da6e0afdcf8c94b08fee12af"

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
