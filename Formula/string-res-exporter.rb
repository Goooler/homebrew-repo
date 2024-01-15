class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/releases/download/v0.1.1/string-res-exporter-0.1.1-binary.jar"
  version "0.1.1"
  sha256 "47af088db59847762dfdb17443186ba5946c95f339f610f5b1b8325520f1c096"

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
