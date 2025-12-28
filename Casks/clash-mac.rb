cask 'clash-mac' do
  version '1.2.7'

  on_arm do
    sha256 '5bd58c3e399775ffb50c365269ed0703240dd3f3bd2e365f55de5b9f150e0bd8'

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-arm64.zip"

    app "ClashMac-v#{version}-macos-arm64/ClashMac.app"
  end
  on_intel do
    sha256 'a28ac2810c3041b27d051c698cc90b47c08f0eb930aba6205709958ec77f65ae'

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-x86_64.zip"

    app "ClashMac-v#{version}-macos-x86_64/ClashMac.app"
  end

  name 'ClashMac'
  desc 'Lightweight Clash Menu Bar Client'
  homepage 'https://github.com/666OS/ClashMac'

  depends_on macos: '>= :big_sur'

  postflight do
    # Informative message for users during installation
    puts 'Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions.'

    # TODO: https://github.com/666OS/ClashMac/blob/main/README.md#solutions
    system_command '/usr/bin/xattr', args: ['-cr', "#{appdir}/ClashMac.app"], sudo: false
  end
end
