class PromptFerry < Formula
  desc "OpenAI-compatible AI gateway with peer-connected nodes"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.1/prompt-ferry-v1.45.1-aarch64-apple-darwin"
      sha256 "583e47c648dfe6c5ecc388055b881dfe8fb74c10f526d1600f14022599d53215"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.1/prompt-ferry-v1.45.1-aarch64-unknown-linux-gnu"
      sha256 "107b085e12ce0caed84eb1e08ffe1a42a6ebf926b97fb66a083c1346af5a1958"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.45.1/prompt-ferry-v1.45.1-x86_64-unknown-linux-gnu"
      sha256 "195739b9385332a80f90e409a5662d7ce4f498b4ea088f3a30830568c005a967"
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
