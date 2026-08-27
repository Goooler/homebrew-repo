cask "kumone" do
  version "0.3.12"
  sha256 "dc59fb6780d7974611b367893f07bdbaa961856dc302e1807345fff637011c6c"

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
