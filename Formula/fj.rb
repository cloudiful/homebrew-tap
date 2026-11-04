class Fj < Formula
  desc "Command-line interface for Forgejo (cloudiful fork)"
  homepage "https://github.com/cloudiful/forgejo-cli"
  version "0.7.0-cloudiful.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.6/forgejo-cli-aarch64-macos.tar.gz"
    sha256 "0eebae9d0126c8c17e8d18b111bb55d03d7d567d2b900a4ef065347556d8ba1a"
    depends_on "openssl@3"
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.6/forgejo-cli-x86_64-linux.tar.gz"
      sha256 "bf33f476596b1c60ff0550aa5422d31df3af34746e5773e3546b9f96f780936a"
    end

    on_arm do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.6/forgejo-cli-aarch64-linux.tar.gz"
      sha256 "f36364d14182e8042e6bd907c684dbeebecfce8cfdd9dfed6481417f111f1795"
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
