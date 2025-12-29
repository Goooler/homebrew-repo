cask "any-portal" do
  version "0.6.31+105"
  sha256 "6037155ccb8a00d1081ab7cce55aa51ea7de1a8e9d7bf38f274848b7780e23ee"

  url "https://github.com/AnyPortal/AnyPortal/releases/download/v#{version}/anyportal-macos.dmg"
  name "AnyPortal"
  desc "GUI for any portal"
  homepage "https://github.com/AnyPortal/AnyPortal"

  app "AnyPortal.app"
end
