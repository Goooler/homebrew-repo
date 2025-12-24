cask "clash-mac" do
  version "1.1.21"

  on_arm do
    sha256 "be9fca21465d709c916a13c89bcb20e17b7f0d5d78b71bc5cfc51ed0533200a1"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 "44a0b850a2f0879072bb67e69727127297a8d262b0c84b94751b26ca73ab9bdb"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-x86_64.zip"

    app "ClashMac-v#{version}-macos-x86_64/ClashMac.app"
  end

  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    # TODO: https://github.com/666OS/ClashMac/blob/main/README.md#solutions
    system_command '/usr/bin/xattr', args: ['-cr', "#{appdir}/ClashMac.app"], sudo: false
  end

  depends_on macos: ">= :big_sur"
end
