class Fj < Formula
  desc "Command-line interface for Forgejo (cloudiful fork)"
  homepage "https://github.com/cloudiful/forgejo-cli"
  version "0.7.0-cloudiful.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.1/forgejo-cli-aarch64-macos.tar.gz"
    sha256 "3e07a82ea20139ff212c6a9d85ca9aea57d0cb3f91bd2a02e5ee3f2db0d9b245"
    depends_on "openssl@3"
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.1/forgejo-cli-x86_64-linux.tar.gz"
      sha256 "83baafb226636245f4fbf78abe94e4a085d1f99b99904b09b1d2dab5e120530a"
    end

    on_arm do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.1/forgejo-cli-aarch64-linux.tar.gz"
      sha256 "a165e6500da68f38919dcd46e26c6975dabd2c9248897d9b54959cc0cb583def"
    end
  end

  conflicts_with "forgejo-cli", because: "both install the fj executable"

  livecheck do
    url :stable
    strategy :github_latest
    regex(/^v?(\d+\.\d+\.\d+-cloudiful\.[1-9]\d*)$/i)
  end

  def install
    bin.install "fj"
    doc.install "LICENSE-MIT", "LICENSE-APACHE"
    generate_completions_from_executable(bin/"fj", "completion")
  end

  def caveats
    if OS.mac?
      <<~EOS
        The macOS binary links Homebrew's openssl@3 at the standard
        /opt/homebrew prefix; custom Homebrew prefixes are not supported.
      EOS
    elsif OS.linux?
      <<~EOS
        The Linux binary requires glibc 2.39 or newer plus system OpenSSL 3
        and zlib libraries.
      EOS
    end
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/fj version")
  end
end
