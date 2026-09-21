class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.14.0/phasegent-v2.14.0-aarch64-apple-darwin"
      sha256 "4299b2741e3519b0dd63ac97b3751f0c281078f5dda025685e9fb4af56b0ed96"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.14.0/phasegent-v2.14.0-aarch64-unknown-linux-gnu"
      sha256 "16457637fbd659e76e2e071a6288313f589b1684acb8553516ca022318e3ff74"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.14.0/phasegent-v2.14.0-x86_64-unknown-linux-gnu"
      sha256 "7357159489b603cbbda94df402f47a41c77893e6244bdf068c3a6d895a153b50"
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
