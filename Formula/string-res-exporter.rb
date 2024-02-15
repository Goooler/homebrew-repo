class StringResExporter < Formula
  desc "A tool for exporting and importing string resources from an Android project to a XLS file"
  homepage "https://github.com/Goooler/StringResExporter"
  version "0.2.1"
  url "https://github.com/Goooler/StringResExporter/archive/v0.2.2.tar.gz"
  sha256 "51dd4d38690d1862b576430a20ffe6e99707fff42e32025902a2e46d59067f76"

  depends_on "openjdk"

  def install
  	mv "string-res-exporter-#{version}-binary.jar", "string-res-exporter.jar"
    libexec.install "string-res-exporter.jar"
    bin.write_jar_script libexec/"string-res-exporter.jar", "string-res-exporter"
  end

  test do
    output = shell_output("#{bin}/string-res-exporter -v")
    assert_includes output, "version #{version}"
  end
end
