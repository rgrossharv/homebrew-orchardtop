class Orchardtop < Formula
  desc "System monitor with Apple Silicon support"
  homepage "https://github.com/rgrossharv/orchardtop"

  url "https://github.com/rgrossharv/orchardtop.git",
      using: :git,
      tag: "v1.4.12",
      revision: "68421024fa1f1b6483acbd4ee2aff93c3d2c2a07"

  version "1.4.12"
  license "Apache-2.0"

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
