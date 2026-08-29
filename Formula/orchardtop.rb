class Orchardtop < Formula
  desc "Pretty system monitor for Apple Silicon Macs"
  homepage "https://github.com/rgrossharv/orchardtop"
  url "https://github.com/rgrossharv/orchardtop.git",
      using: :git,
      tag: "v1.4.7-orchard.1",
      revision: "ab1bb003e9dc8c05fcf5f44383e088cb08f9fde8"
  version "1.4.7-orchard.1"
  license "Apache-2.0"

  depends_on arch: :arm64

  def install
    system "make", "QUIET=true"

    bin.install "bin/orchardtop"
    doc.install "README.md", "APPLE_SILICON.md", "LICENSE", "NOTICE"
    (doc / "third-party").install "include/fmt/LICENSE.rst"
    (share / "orchardtop").install "themes"
  end

  test do
    assert_match "OrchardTop version:", shell_output("#{bin}/orchardtop --version")
  end
end
