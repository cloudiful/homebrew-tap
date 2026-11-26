class PromptFerry < Formula
  desc "OpenAI-compatible AI gateway with peer-connected nodes"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.2/prompt-ferry-v1.45.2-aarch64-apple-darwin"
      sha256 "a4ef4588c22bfebc43cf580e96d0fdcf254f33922e349a9bedb83662f42d1a0d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.2/prompt-ferry-v1.45.2-aarch64-unknown-linux-gnu"
      sha256 "75f486a01ed477d65a0ea8e5a8e5408df75f79f6d5f2da7329dafacde37ff78a"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.2/prompt-ferry-v1.45.2-x86_64-unknown-linux-gnu"
      sha256 "cc90459314091cb5fd0bfcbb572d8088bea78ed463cf21bba4f429c35c326703"
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
