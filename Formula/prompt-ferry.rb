class PromptFerry < Formula
  desc "OpenAI-compatible relay and worker for upstream ferrying"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.31/prompt-ferry-v1.42.31-aarch64-apple-darwin"
      sha256 "e5bae0b3b7d5d4bc414c888ad85186a740a83a86258f3ef5a6f2132babbfe269"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.31/prompt-ferry-v1.42.31-aarch64-unknown-linux-gnu"
      sha256 "27caa78a4fa2a29f0e6361ba5068918e70697cbe225593fa4d50391acefcebb0"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.31/prompt-ferry-v1.42.31-x86_64-unknown-linux-gnu"
      sha256 "f7d616f7b211e3dba095e05261bb5da8bf146e7a4209706b52300e85c595b251"
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
