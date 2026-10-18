class GitAiCommit < Formula
  desc "AI-generated Git commit messages from staged changes"
  homepage "https://github.com/cloudiful/git-ai-commit"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/git-ai-commit/releases/download/v0.1.17/git-ai-commit-macos-arm64"
      sha256 "bb23e5f1001c264552a734d2761e6742c6f5eec5a9536d5bff5827a9410a3c12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/git-ai-commit/releases/download/v0.1.17/git-ai-commit-linux-arm64"
      sha256 "ebfb27e1b904e6366ba92c00a318f23e077fd2bd849e3c9e3dcc4eb2a848e3f4"
    end
    on_intel do
      url "https://github.com/cloudiful/git-ai-commit/releases/download/v0.1.17/git-ai-commit-linux-amd64"
      sha256 "0169c01eaae1f306ca7d52c20e358853d99d9c8208f70fce6475696aaa248f63"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["git-ai-commit-*"].first => "git-ai-commit"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-ai-commit --version")
  end
end
