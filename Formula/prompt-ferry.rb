class PromptFerry < Formula
  desc "OpenAI-compatible AI gateway with peer-connected nodes"
  homepage "https://github.com/cloudiful/prompt-ferry"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64

    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.44.0/prompt-ferry-v1.44.0-aarch64-apple-darwin"
      sha256 "791a2a7d37d1135d61b4251b6cf347be57d1605c411d9b2092c3d011cb70e563"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.44.0/prompt-ferry-v1.44.0-aarch64-unknown-linux-gnu"
      sha256 "db86a5ed1fba0942a5123e559ad31f78df69bc5a44beb15cb667b8ebeb2acf64"
    end
    on_intel do
      url "https://github.com/cloudiful/prompt-ferry/releases/download/v1.44.0/prompt-ferry-v1.44.0-x86_64-unknown-linux-gnu"
      sha256 "0b60c25e9f2bc9aaff35b3b0bcf3bcae945549500d41cf077dcd0628c1ae6299"
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
