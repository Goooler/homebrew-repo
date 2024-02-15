class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/releases/download/v0.2.1/string-res-exporter-binary.jar"
  sha256 "3ef13f0d454f73b037c4bfa52bc6814fb92ab815cdaf66d2d8920c6e9728737c"

  depends_on "openjdk"

  def install
    mv "string-res-exporter-binary.jar", "string-res-exporter.jar"
    libexec.install "string-res-exporter.jar"
    bin.write_jar_script libexec/"string-res-exporter.jar", "string-res-exporter"
  end

  test do
    output = shell_output("#{bin}/string-res-exporter -h")
    assert_includes output, "Usage: exporter"
  end
end
