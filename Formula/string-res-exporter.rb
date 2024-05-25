class StringResExporter < Formula
  version "0.2.2"
  sha256 "5855d97a86116d4c0bbc6d6c88bf05679d58b468f426b0ae7cabff408419535d"

  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/releases/download/v#{version}/string-res-exporter-#{version}-binary.jar"

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
