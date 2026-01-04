cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.19"
  sha256 arm:   "ef5a9500d8d303742f1ed7017b8f4e4d849beccf9a46b4713890dbbafdcc6149",
         intel: "4b01e874b27220d3bbf0ad9daca3a35d6ed795f4e375ae49d47a6b2449ebfe07"

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
