class Orchardtop < Formula
  desc "Pretty system monitor for Apple Silicon Macs"
  homepage "https://github.com/rgrossharv/orchardtop"

  url "https://github.com/rgrossharv/orchardtop.git",
      using: :git,
      tag: "v1.4.8",
      revision: "fbef0ab5a0b8eef1dabfd1c877283fc730119570"

  version "1.4.8"
  license "Apache-2.0"

  depends_on arch: :arm64

  def install
    system "make", "QUIET=true"

    bin.install "bin/orchardtop"
    bin.install "otop"

    doc.install "README.md", "APPLE_SILICON.md", "LICENSE", "NOTICE"
    (doc / "third-party").install "include/fmt/LICENSE.rst"
    (share / "orchardtop").install "themes"
  end

  test do
    assert_match "OrchardTop version:", shell_output("#{bin}/orchardtop --version")
  end
end
