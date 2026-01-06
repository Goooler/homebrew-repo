cask "clash-mac" do
  arch arm: "arm64", intel: "x86_64"

  on_sequoia :or_older do
    version "1.4.24"
    sha256 arm:   "6d5d03caf51fcc4057de3e473db31ebb6cb91afd5d723b3262e0a1332f9a4e8e",
           intel: "f8a48ef712cb8d37e643ba624b3b645080f34b9ae6433152c817073eb80a101a"

    url "https://github.com/666OS/ClashMac/releases/download/v#{version}/ClashMac-v#{version}-macos-#{arch}.zip"

    livecheck do
      skip "Legacy version"
    end

    app "ClashMac-v#{version}-macos-#{arch}/ClashMac.app"
  end
  on_tahoe :or_newer do
    version "26.0"
    sha256 arm:   "1e00a2e4c5cad4a24a650a090b72bc780beab1cf2692b7e40f8b6248c8c46a5f",
           intel: "7d875aa55639bbe924bc3f3dda0f982b1b9ce087d3a82bef363459ab0d01b3f0"

    url "https://github.com/666OS/ClashMac/releases/download/#{version}/ClashMac-#{version}-macos-#{arch}.zip"

    app "ClashMac-#{version}-macos-#{arch}/ClashMac.app"
  end

  name "ClashMac"
  desc "Lightweight Clash Menu Bar Client"
  homepage "https://github.com/666OS/ClashMac"

  depends_on macos: ">= :monterey"

  postflight do
    # Informative message for users during installation
    puts "Run `xattr -cr /Applications/ClashMac.app` for the APP, see more details in https://github.com/666OS/ClashMac/blob/main/README.md#solutions."

    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/ClashMac.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/clashmac",
    "~/Library/Caches/app.clashmac.ClashMacDashboard",
    "~/Library/Caches/lv.llv.ClashMac",
    "~/Library/Logs/ClashMac",
    "~/Library/Preferences/app.clashmac.ClashMacDashboard.plist",
    "~/Library/Preferences/lv.llv.ClashMac.plist",
    "~/Library/Saved Application State/lv.llv.ClashMac.savedState",
    "~/Library/WebKit/lv.llv.ClashMac",
  ]
end
