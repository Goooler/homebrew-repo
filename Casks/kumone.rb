cask "kumone" do
  version "0.3.38"
  sha256 "e9bc1798dbee147dd9d0331d36a8e308fecb89738b7f43e1dcb4c4195e11939a"

  url "https://github.com/missuo/kumone/releases/download/v#{version}/Kumone-#{version}.zip"
  name "Kumone"
  desc "Native client for NetEase Cloud Music"
  homepage "https://github.com/missuo/kumone"

  depends_on macos: :sequoia

  app "Kumone.app"

  zap trash: [
    "~/Library/Application Support/Kumone",
    "~/Library/Caches/im.missuo.Kumone",
    "~/Library/HTTPStorages/im.missuo.Kumone",
    "~/Library/Preferences/im.missuo.Kumone.plist",
    "~/Library/Saved Application State/im.missuo.Kumone.savedState",
  ]
end
