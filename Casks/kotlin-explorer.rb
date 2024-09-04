cask "kotlin-explorer" do
  version "1.6.0"

  on_arm do
    sha256 "2584675e95e14d48935f3085c7945e8dea5b0ef19311944d8dad530d4db8c4eb"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-arm64-#{version}.dmg"
  end
  on_intel do
    sha256 "354468bc4a1ec11195e1569dfacfa3ce668d8193430df4f40d50c6609bc34f77"

    url "https://github.com/romainguy/kotlin-explorer/releases/download/v#{version}/kotlin-explorer-x64-#{version}.dmg"
  end

  name "Kotlin Explorer"
  desc "Quickly and easily disassemble Kotlin code"
  homepage "https://github.com/romainguy/kotlin-explorer"

  app "Kotlin Explorer.app"
end
