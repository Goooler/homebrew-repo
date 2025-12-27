cask "hiddify" do
  version "2.5.7"
  sha256 "9122669659b73e613bda8a7c6ac959d5983faf6739bd8a79e3cf573d20d5ab36"

  url "https://github.com/hiddify/hiddify-app/releases/download/v#{version}/Hiddify-MacOS.dmg"
  name "Hiddify"
  desc "Multi-platform auto-proxy client"
  homepage "https://github.com/hiddify/hiddify-app"
  release_url "https://github.com/hiddify/hiddify-app/releases/tag/v#{version}"

  app "Hiddify.app"
end
