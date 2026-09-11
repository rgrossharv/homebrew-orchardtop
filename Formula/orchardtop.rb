class Orchardtop < Formula
  desc "Pretty system monitor for Apple Silicon Macs"
  homepage "https://github.com/rgrossharv/orchardtop"

  url "https://github.com/rgrossharv/orchardtop.git",
      using: :git,
      tag: "v1.4.11",
      revision: "8842dbe37d09c7c304194aac5aca08be1d255742"

  version "1.4.11"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on "gcc@15"

  def install
    system "make", "QUIET=true", "CXX=#{Formula["gcc@15"].opt_bin}/g++-15"

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
