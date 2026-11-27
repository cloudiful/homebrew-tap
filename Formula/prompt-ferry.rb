class PromptFerry < Formula
  desc "OpenAI-compatible AI gateway with peer-connected nodes"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.4/prompt-ferry-v1.45.4-aarch64-apple-darwin"
      sha256 "95d098669c2809f35ae6de0fe22af55d7a6a4aecd4817bea33c0115f31bfd1e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.4/prompt-ferry-v1.45.4-aarch64-unknown-linux-gnu"
      sha256 "9039156da4a3b8d6748fb349f7e66a9b80c10203cfbddd86e2667b4b86438f8a"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.4/prompt-ferry-v1.45.4-x86_64-unknown-linux-gnu"
      sha256 "42a8e4b03ccdd6ca2387f787c3a77952954687db9dca44f08b367ba3ee062849"
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
