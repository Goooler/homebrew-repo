cask "compose-mesh" do
  version "1.0.0"
  sha256 "8853baffd99dc55b850b95c18157a6c0673bb774ab2e975884adefbf30f91e6d"

  url "https://github.com/c5inco/Mesh/releases/download/v#{version}/Mesh-#{version}.dmg"
  name "Mesh"
  desc "Compose Desktop application for creating and editing mesh gradients"
  homepage "https://github.com/c5inco/Mesh"

  app "Mesh.app"
end
