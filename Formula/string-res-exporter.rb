class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/releases/download/v0.1.0/string-res-exporter-0.1.0-binary.jar"
  version "0.1.0"
  sha256 "4a0991cff81bab2fee72f0347035e2d419c73fe3c606ae804702db0ab4b629a7"

  depends_on "openjdk"

  def install
  	mv "string-res-exporter-#{version}-binary.jar", "string-res-exporter.jar"
    libexec.install "string-res-exporter.jar"
    bin.write_jar_script libexec/"string-res-exporter.jar", "string-res-exporter"
  end

  test do
    output = shell_output("#{bin}/string-res-exporter --help")
    assert_includes output, "java.lang.ArrayIndexOutOfBoundsException"
  end
end
