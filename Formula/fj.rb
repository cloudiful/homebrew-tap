class Fj < Formula
  desc "Command-line interface for Forgejo (cloudiful fork)"
  homepage "https://github.com/cloudiful/forgejo-cli"
  version "0.7.0-cloudiful.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.4/forgejo-cli-aarch64-macos.tar.gz"
    sha256 "525900cf9d003585e0da764b4b7f10e1f1997575745d8e895187781767106bf8"
    depends_on "openssl@3"
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.4/forgejo-cli-x86_64-linux.tar.gz"
      sha256 "987bc655c15951dfc642fc2d9aef0ebb0e50239c6e8a97fb382757c2327ef49c"
    end

    on_arm do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.4/forgejo-cli-aarch64-linux.tar.gz"
      sha256 "f9f63f2113cbbb9492f21cd10824c40bcf2e11d6b2da95a6aa5450cb299c1279"
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
