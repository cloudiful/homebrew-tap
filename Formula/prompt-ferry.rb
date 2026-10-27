class PromptFerry < Formula
  desc "OpenAI-compatible relay and worker for upstream ferrying"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.30/prompt-ferry-v1.42.30-aarch64-apple-darwin"
      sha256 "18bedf8b4645aa63adea224bf4867b96418191ee46b85dff3c9ce7a0f7f2d9aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.30/prompt-ferry-v1.42.30-aarch64-unknown-linux-gnu"
      sha256 "17ef1ba843510997c208d6f5bc2ffb830e250b88ff16883f3b260fa0148d41b0"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.30/prompt-ferry-v1.42.30-x86_64-unknown-linux-gnu"
      sha256 "720d27212a0df99d712acb7241d77281eae6d1a0e960259a559907d11b4e3f73"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def caveats
    if OS.linux?
      <<~EOS
        The Linux binaries require glibc 2.39 or newer.
      EOS
    end
  end

  def install
    bin.install Dir["prompt-ferry-*"].first => "prompt-ferry"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/prompt-ferry --version")
  end
end
