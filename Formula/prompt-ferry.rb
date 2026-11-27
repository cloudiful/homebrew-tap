class PromptFerry < Formula
  desc "OpenAI-compatible AI gateway with peer-connected nodes"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.3/prompt-ferry-v1.45.3-aarch64-apple-darwin"
      sha256 "ab4ff1c59293102482f7d6328fad538f236f19fc0f0fac626b287cff3526a482"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.3/prompt-ferry-v1.45.3-aarch64-unknown-linux-gnu"
      sha256 "2de58d27ffdbcb5260cb742cc1224b8caa213a025745190af305f1794a23372c"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.3/prompt-ferry-v1.45.3-x86_64-unknown-linux-gnu"
      sha256 "f67b86d5dfd732ba860251ba6319124f49a6e59a85f3a1cf975e7db679f7915f"
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
