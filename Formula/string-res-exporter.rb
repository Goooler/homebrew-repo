class StringResExporter < Formula
  desc "Exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/archive/refs/tags/v0.2.5.tar.gz"
  sha256 "d243608cfa21560fee398ace6e71f18fae41a29b4bd9d5e0970a995fbc70008f"

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
