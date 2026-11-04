class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.4/phasegent-v2.32.4-aarch64-apple-darwin"
      sha256 "1a975c13d1343340f068b1706ff576870ceb2cbee153fdfcb64719a3ba7c5776"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.4/phasegent-v2.32.4-aarch64-unknown-linux-gnu"
      sha256 "f8215d1d49d09be22cfed92a6ecb281444537b178162aeb93fc6e660092f0122"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.4/phasegent-v2.32.4-x86_64-unknown-linux-gnu"
      sha256 "cabf0e9fb15e90aa9eb680cd0da11a2584c8247d16da46a5255dd28a8ec5642b"
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
