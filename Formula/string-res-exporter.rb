class StringResExporter < Formula
  desc "Exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/releases/download/v0.2.5/string-res-exporter-0.2.5-binary.jar"
  sha256 "afc7cf8504bea1fcb49e49805fc691ef24a85c6d9b8b95a47396cfd76668d9d6"

  depends_on "openjdk"

  def install
    mv "string-res-exporter-#{version}-binary.jar", "string-res-exporter.jar"
    libexec.install "string-res-exporter.jar"
    bin.write_jar_script libexec / "string-res-exporter.jar", "string-res-exporter"
  end

  test do
    output = shell_output("#{bin}/string-res-exporter -h")
    assert_includes output, "Usage: exporter"
  end
end
