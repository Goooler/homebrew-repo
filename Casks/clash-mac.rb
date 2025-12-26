cask "clash-mac" do
  version "1.2.0"

  on_arm do
    sha256 "d13585c5e92f0d54a61b94987917a57494776267c98a1d1e9cab2f4374d03bde"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 "42cc34fc4e95528647e41afdbd565a2a70383eac99ec717860f07615fa82cb64"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-x86_64.zip"

    app "ClashMac-v#{version}-macos-x86_64/ClashMac.app"
  end

  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :big_sur"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    # TODO: https://github.com/666OS/ClashMac/blob/main/README.md#solutions
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end
end
