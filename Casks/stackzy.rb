cask 'stackzy' do
  version '1.2.6'

  if Hardware::CPU.intel?
    sha256 '1bf51366ebd0af9deb9ea2595d455876a4d614ea7a86637bef8812d061c0129f'
    url "https://github.com/theapache64/stackzy/releases/download/#{version}/Stackzy-macos-x64-#{version}.jar"
  else
    sha256 '846ea70de61211becd91c44036c3b20926dd0f94e073eae94ed88b33594a2768'
    url "https://github.com/theapache64/stackzy/releases/download/#{version}/Stackzy-macos-arm64-#{version}.jar"
  end

  name 'Stackzy'
  homepage 'https://github.com/theapache64/stackzy'

  app 'Stackzy.app'
end
