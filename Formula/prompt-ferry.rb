class PromptFerry < Formula
  desc "OpenAI-compatible AI gateway with peer-connected nodes"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.0/prompt-ferry-v1.45.0-aarch64-apple-darwin"
      sha256 "35b41d6943e1f3f3b9944a20029913bd44c0fb67a02a8f87ce1cd8f3767c6ad9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.0/prompt-ferry-v1.45.0-aarch64-unknown-linux-gnu"
      sha256 "dc4685601bb944e151671f21a3c14946f34f2a9fbaaee1dee7dd48d509f8b037"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.0/prompt-ferry-v1.45.0-x86_64-unknown-linux-gnu"
      sha256 "73c0eb5b49b72ac8d913c32837a6fd25c743a0918f6ded6edc2e6f98b8b528ed"
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
