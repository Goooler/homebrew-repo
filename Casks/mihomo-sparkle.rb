cask "mihomo-sparkle" do
  version "1.6.11"

  on_arm do
    sha256 "d3dcee4b10f65b1b38a1dd6dbc6fba3c48a66153f93588b0a2717e4cef9a125b"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"

    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 "e536de5632aae402d8f7b1a6bbf7425eb766b10c07096a9a8a7e93d3fd923858"

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
