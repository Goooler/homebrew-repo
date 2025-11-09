cask "mihomo-sparkle" do
  version "1.6.14"

  on_arm do
    sha256 "db203b0c8833e0e176e9a222d8df5ea72451494f05bfb6b92fb9e2dbcb28bd52"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"

    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 "614565c8703338c210d1498dab801c6fc8eff2042bc3145ed0413536bd7cf794"

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
