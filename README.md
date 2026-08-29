# OrchardTop Homebrew tap

This tap installs OrchardTop, a system monitor for Apple Silicon Macs.

## Install

Use this one command:

```bash
brew install rgrossharv/orchardtop/orchardtop
```

Or add the tap first:

```bash
brew tap rgrossharv/orchardtop
brew install orchardtop
```

OrchardTop needs an Apple Silicon Mac. It does not support Intel Macs yet.

## Update the formula

The formula points to a specific OrchardTop release tag and commit. When a
new release is made, update `url`, `revision`, and `version` in
`Formula/orchardtop.rb`, then test it:

```bash
brew audit --new-formula Formula/orchardtop.rb
brew install --build-from-source ./Formula/orchardtop.rb
```

The main OrchardTop project keeps the Apache License 2.0 notice and the
third-party `fmt` license in its installed documentation.
