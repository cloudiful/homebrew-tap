class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.6/phasegent-v2.21.6-aarch64-apple-darwin"
      sha256 "66f33d27ceb03b061cc2f1607d5f7a90f6ad063700221b51dc6532c1ac5b0893"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.6/phasegent-v2.21.6-aarch64-unknown-linux-gnu"
      sha256 "305cd271273cf7655b5fe62d88e309977a6a707219ea8551d693f83c4b55df17"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.6/phasegent-v2.21.6-x86_64-unknown-linux-gnu"
      sha256 "c9331c686f32c5e8ad40d6cf4561de15e085c0ab43ff8a5ed9c3dd7ae1e9d86e"
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
