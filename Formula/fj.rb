class Fj < Formula
  desc "Command-line interface for Forgejo (cloudiful fork)"
  homepage "https://github.com/cloudiful/forgejo-cli"
  version "0.7.0-cloudiful.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.5/forgejo-cli-aarch64-macos.tar.gz"
    sha256 "8fdea931e53bdda513a69a2ebe2b47c5f7a7091bc5869698aba5571b29a2eced"
    depends_on "openssl@3"
  end

  on_linux do
    on_intel do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.5/forgejo-cli-x86_64-linux.tar.gz"
      sha256 "229d6265581ff8adf5c42b261c9d8f20ffbf57c6c0378d8f516983d51d13a8d3"
    end

    on_arm do
      url "https://github.com/cloudiful/forgejo-cli/releases/download/v0.7.0-cloudiful.5/forgejo-cli-aarch64-linux.tar.gz"
      sha256 "553ede5f468ef3099f33ea955eedb131a6f91f31987c535c789deaca7562fd06"
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
