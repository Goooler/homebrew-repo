cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  version "1.4.16"
  sha256 arm:   "4a8fb56cf5d7d4ede9ef6952990bd5d6ec307815c5e114c71f7f06d1087e4f40",
         intel: "e178a857eb8c5cebd14cca1fbebd0b5dd5915beace4a116d3f75c42e0b4a64ce"

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
