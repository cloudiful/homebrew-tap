class PromptFerry < Formula
  desc "OpenAI-compatible relay and worker for upstream ferrying"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.32/prompt-ferry-v1.42.32-aarch64-apple-darwin"
      sha256 "f95bb99ab1dc7e28aec28103149edf49e68fa9646d0b96c516253805a2fa23e0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.32/prompt-ferry-v1.42.32-aarch64-unknown-linux-gnu"
      sha256 "51879dcb10089e97112f7785feee8de9a9fcfa7e4e821a2e3cf4a5ab7ed1d8c6"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.32/prompt-ferry-v1.42.32-x86_64-unknown-linux-gnu"
      sha256 "29452eef9d65086bdd9a5a68f917360b0c80c2fb17f2e2e0ba7012cf50410fcc"
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
