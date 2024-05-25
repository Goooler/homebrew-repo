class StringResExporter < Formula
  version "0.2.3"
  sha256 "54349e3196b3e5bf7a86de2a8e4b9e89ec29849d4d82a2a9b9da3e53572c1480"

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
