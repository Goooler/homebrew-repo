cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.9"
  sha256 arm:   "7c39519fb269e2ff8fa70bc4c9694f7b9a8d4b7ff867313bf1b1b86f918dc262",
         intel: "5ca13b9b14015185f40f2bc5145284acf8303d8c4b334c3b0d9ef8ac738c32a8"

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
