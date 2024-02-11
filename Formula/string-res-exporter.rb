class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  url "https://github.com/Goooler/StringResExporter/archive/v0.2.1.tar.gz"
  version "0.2.0"
  sha256 "9cfe9943c0f31f4de760054093f3ac0440505a995d6f140604e9a240307348fa"

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
