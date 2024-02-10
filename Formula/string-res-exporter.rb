class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/releases/download/v0.2.0/string-res-exporter-0.2.0-binary.jar"
  version "0.2.0"
  sha256 "cf571b0ee8840ac2b2f55ee9d0fc851dac473834db8a6b633deab24fb96e2025"

  depends_on "openjdk"

  def install
  	mv "string-res-exporter-#{version}-binary.jar", "string-res-exporter.jar"
    libexec.install "string-res-exporter.jar"
    bin.write_jar_script libexec/"string-res-exporter.jar", "string-res-exporter"
  end

  test do
    output = shell_output("#{bin}/string-res-exporter --help")
    assert_includes output, "Index 1 out of bounds for length 1"
  end
end
