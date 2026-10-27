cask "kumone" do
  version "0.3.23"
  sha256 "54f225f25da07325f3a6a76087b9ac5ad9b21fe281bcec378a727f703bd81bfb"

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
