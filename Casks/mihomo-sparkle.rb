cask "mihomo-sparkle" do
  version "1.6.12"

  on_arm do
    sha256 "9253154304d001be56189ef6380550bfa0ba48a139d7972a0b3b59480a0fbf44"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"

    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 "32d495dec0eedb42aebe2468038d56f29fc00c0cd39ed7e09d374938e9cc0366"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-x64.pkg"

    pkg "sparkle-macos-#{version}-x64.pkg"
  end

  name "Sparkle"
  desc "Another Mihomo GUI"
  homepage "https://github.com/xishang0128/sparkle"

  postflight do
    system_command "/usr/libexec/PlistBuddy", # TODO: https://github.com/xishang0128/sparkle/issues/28
                   args: [
                     "-c", "Add :LSUIElement integer 1", # https://discussions.apple.com/thread/7444141
                     "/Applications/Sparkle.app/Contents/Info.plist"
                   ],
                   sudo: true
  end

  uninstall pkgutil: "com.xishang0128.sparkle"
end
