cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.15"
  sha256 arm:   "b341059a76b0b3d43b789809e4b0d46fee0258d2df087a398adeb36957a584b8",
         intel: "46a2ec23e35eaa21a9f5b2224e502a2a60b6f8f34edf24ed8e5713793e2dbabd"

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
