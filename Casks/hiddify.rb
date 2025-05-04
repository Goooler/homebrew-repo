cask "hiddify" do
  version "2.0.5"
  sha256 "71d4314ef0ce9d3bffb423a438ebeb9bae9ec8decfe0e17f5e6327201849e138"

  url "https://github.com/hiddify/hiddify-app/releases/download/v#{version}/Hiddify-MacOS.dmg"
  name "Hiddify"
  desc "Multi-platform auto-proxy client"
  homepage "https://github.com/hiddify/hiddify-app"

  depends_on macos: ">= :catalina"

  app "Hiddify.app"
end
