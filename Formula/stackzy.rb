class Stackzy < Formula
  desc 'A desktop app to analyse APK. Built using Compose desktop'
  homepage 'https://github.com/theapache64/stackzy'

  if Hardware::CPU.intel?
    sha256 'd767eb0b5c291b2cbd8989cd21ecd090ba0cb7f000e4b3ae84cfd5bc53c88c13'
    url "https://github.com/theapache64/stackzy/archive/refs/tags/1.2.7.tar.gz"
  else
    sha256 '846ea70de61211becd91c44036c3b20926dd0f94e073eae94ed88b33594a2768'
    url "https://github.com/theapache64/stackzy/releases/download/1.2.6/Stackzy-macos-arm64-1.2.6.jar"
  end

  depends_on "openjdk"

  def install
    libexec.install Dir["*.jar"].first => "stackzy.jar"
    bin.write_jar_script libexec / "stackzy.jar", "stackzy"
  end

  test do
    # Do nothing
  end
end
