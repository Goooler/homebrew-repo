class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/archive/refs/tags/v0.2.4.tar.gz"
  sha256 "3fabb2a35cfa0d05364c609ec5daa34cc167eef679bbb55ce18e75dbe6a2ad12"

  depends_on "openjdk"

  def install
    mv "string-res-exporter-0.2.3-binary.jar", "string-res-exporter.jar"
    libexec.install "string-res-exporter.jar"
    bin.write_jar_script libexec / "string-res-exporter.jar", "string-res-exporter"
  end

  test do
    output = shell_output("#{bin}/string-res-exporter -h")
    assert_includes output, "Usage: exporter"
  end
end
