cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.17"
  sha256 arm:   "f3bc419adf76d615f480bf749cf47cc44755722dff0c860b817263f055494687",
         intel: "3c1e4004ed2ff024f6d775430be0d3f7fe9f70242033b5f7a2aad2670c24b270"

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
