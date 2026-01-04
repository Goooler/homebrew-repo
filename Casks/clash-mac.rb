cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.18"
  sha256 arm:   "b63f5e9e518d6822e5fb0033d40c8d302ee1a952390ff4116dcf7aa7889351a7",
         intel: "bbaf23797f2ff4e48af02af4bc5598a7c3a8e6720cace38c2e8a8def853c6375"

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
