cask "any-portal" do
  version "0.6.24+98"
  sha256 "5dd95b5ca053f73a7b5bd51eae10a579698baec3c3afe09aeb25bcffe3509754"

  url "https://github.com/AnyPortal/AnyPortal/releases/download/v#{version}/anyportal-macos.dmg"
  name "AnyPortal"
  desc "GUI for any portal"
  homepage "https://github.com/AnyPortal/AnyPortal"

  app "AnyPortal.app"
end
