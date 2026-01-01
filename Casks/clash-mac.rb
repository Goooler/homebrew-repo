cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.2"
  sha256 arm:   "e83d9d7d70a088b1367a910d9a3b5af7927cb9674f26216334c4339158d726fd",
         intel: "8ece1f081f21f2eb842b75609049e0e629ca169431510c2030fe2e7b88dde857"

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
