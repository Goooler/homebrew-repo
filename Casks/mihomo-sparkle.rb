cask "mihomo-sparkle" do
  version "1.6.13"

  on_arm do
    sha256 "cf04b04c45abd425a510bd9f9e7431d80ad5317335e665466b31117687641189"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"

    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 "8f3ee3a7d5630644b9c9f63bbdb09fe6ef4cbd41d151eef05edb30a2a0b792d1"

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
