class PromptFerry < Formula
  desc "OpenAI-compatible relay and worker for upstream ferrying"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.34/prompt-ferry-v1.42.34-aarch64-apple-darwin"
      sha256 "f318144c9fff0731d53792e950953cd1d4dd280b6e0cacef8bfbd0f0371b433e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.34/prompt-ferry-v1.42.34-aarch64-unknown-linux-gnu"
      sha256 "0874db1dd968c481544e835ed896302f7bcb730c5192eaee809112ca15c08299"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.42.34/prompt-ferry-v1.42.34-x86_64-unknown-linux-gnu"
      sha256 "0d808867451517e182479ade11a4158c0459ae024da3e246913a49b41caa8d17"
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
