class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.7/phasegent-v2.21.7-aarch64-apple-darwin"
      sha256 "de18d855d2a6fff90b564f925befc5aacb0d6a2e7dace677646ed6da79f61a58"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.7/phasegent-v2.21.7-aarch64-unknown-linux-gnu"
      sha256 "409a1e351964bd1f97f419b36d8777733737717144b3762dfda5a886fe84d3e2"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.7/phasegent-v2.21.7-x86_64-unknown-linux-gnu"
      sha256 "6a8c1f0ae134e8fc41edd3714ad3e0ccfe6d42ea9eb3a194a7be9e67daa8dbf7"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
