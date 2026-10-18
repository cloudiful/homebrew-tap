class GitAiCommit < Formula
  desc "AI-generated Git commit messages from staged changes"
  homepage "https://github.com/cloudiful/git-ai-commit"
  version "0.1.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/git-ai-commit/releases/download/v0.1.18/git-ai-commit-macos-arm64"
      sha256 "6d8152f0faed7c6b49c42fbcf3e68842f944966c37b8dd4e8aa5e584bbb16df2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/git-ai-commit/releases/download/v0.1.18/git-ai-commit-linux-arm64"
      sha256 "ac78acd6eee8f971aae5a2fa92652fdaaf271c18243eebe309e364af9b52fc7c"
    end
    on_intel do
      url "https://github.com/cloudiful/git-ai-commit/releases/download/v0.1.18/git-ai-commit-linux-amd64"
      sha256 "a17608b758e7f561adc3303d4b8e611d66c4e5e1e77febf5d213311b5dab943d"
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
