cask "mihomo-sparkle" do
  version "1.6.10"

  on_arm do
    sha256 "6e0ef54f9a1f47b9588dc50f371ee8bff3c158fba2b76e4f93ad32ea0ae8d536"

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"

    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 "8e1af1642b8916c327848ee44f0dc07583a379975629370c0e0daf24fd8991ce"

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
