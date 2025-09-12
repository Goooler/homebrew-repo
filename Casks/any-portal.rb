cask "any-portal" do
  version "0.6.30+104"
  sha256 "8ef073434b3f8e36c018878af1bf670db17d35382f97d0ab0bb89be301f60a7f"

  url "https://github.com/AnyPortal/AnyPortal/releases/download/v#{version}/anyportal-macos.dmg"
  name "AnyPortal"
  desc "GUI for any portal"
  homepage "https://github.com/AnyPortal/AnyPortal"

  app "AnyPortal.app"
end
