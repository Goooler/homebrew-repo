cask "kotlin-explorer" do
  version "1.4.7"

  if Hardware::CPU.intel?
    sha256 '7a1970af3c27936f79077732a9170078f6b010e1acc9fb25082d7501d37801b8'
    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  else
    sha256 '76a152d5d196144f9ff158b16e26c484d44083513713673a681b5fbd1d8d4f32'
    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
