cask "kotlin-explorer" do
  version "1.6.0"

  on_arm do
    sha256 "2584675e95e14d48935f3085c7945e8dea5b0ef19311944d8dad530d4db8c4eb"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "7a1970af3c27936f79077732a9170078f6b010e1acc9fb25082d7501d37801b8"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
