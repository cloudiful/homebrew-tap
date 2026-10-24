class Fj < Formula
  desc "Command-line interface for Forgejo (cloudiful fork)"
  homepage "https://github.com/cloudiful/forgejo-cli"
  version "0.7.0-cloudiful.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.2/forgejo-cli-aarch64-macos.tar.gz"
    sha256 "3922d6c7e82530560f2009d971fb478a752bf2d96bc230da3c9a559b8e4b4827"
    depends_on "openssl@3"
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.2/forgejo-cli-x86_64-linux.tar.gz"
      sha256 "4e1e609bc89df86c28fc63f7158918c54098189117adba2c8ce6d7e86bf39164"
    end

    on_arm do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.2/forgejo-cli-aarch64-linux.tar.gz"
      sha256 "66bb4310f3d63c84e222d947ea09981d4fd7fd0ac52a40f01402f266984b896b"
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
