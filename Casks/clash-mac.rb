cask "clash-mac" do
  version "1.1.22"

  on_arm do
    sha256 "a48507ced6d3af387e7b2b49275859b7d0fd370279792da29244bf66a4b6dc9f"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 "0ea32d20b4134b87a535aa02804efe439173d535e35ce5b6c201a54ca49e3384"

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
