cask 'mihomo-sparkle' do
  version '1.6.16'

  on_arm do
    sha256 '9d038ee2d802d7c4f2d8008418cca6035a3787df88ca702d8c2668523588e231'

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-arm64.pkg"

    pkg "sparkle-macos-#{version}-arm64.pkg"
  end
  on_intel do
    sha256 '1dac90308dfe22b5ec8f60ef61fa9b2966e356e9384aa7788a5789e1d7936698'

    url "https://github.com/xishang0128/sparkle/releases/download/#{version}/sparkle-macos-#{version}-x64.pkg"

    pkg "sparkle-macos-#{version}-x64.pkg"
  end

  name 'Sparkle'
  desc 'Another Mihomo GUI'
  homepage 'https://github.com/xishang0128/sparkle'

  postflight do
    system_command '/usr/libexec/PlistBuddy', # TODO: https://github.com/xishang0128/sparkle/issues/28
                   args: [
                     '-c', 'Add :LSUIElement integer 1', # https://discussions.apple.com/thread/7444141
                     '/Applications/Sparkle.app/Contents/Info.plist'
                   ],
                   sudo: true
  end

  uninstall pkgutil: 'com.xishang0128.sparkle'
end
