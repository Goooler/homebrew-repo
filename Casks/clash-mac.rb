cask "clash-mac" do
  version "1.1.25"

  on_arm do
    sha256 "acf81e90468fa982eafcb4e2d908f74f57fd8bf4a5d44ebce65ab5638948d31d"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 "df7bcb889d94d8bafd29adfd152d39248c398f32d086c5ed125ba9c31fd954fb"

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
