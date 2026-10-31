class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.2/phasegent-v2.32.2-aarch64-apple-darwin"
      sha256 "411885845df153683aee9f285cd1c3a7210700b791306279c17a6f44ae9a9113"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.2/phasegent-v2.32.2-aarch64-unknown-linux-gnu"
      sha256 "10bfd8fdd2425888f31cf1a0b018086c1b570e7a77f17a79d79ec61e2dfaa2b9"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.2/phasegent-v2.32.2-x86_64-unknown-linux-gnu"
      sha256 "aac6eb88015473f2aff41c2b4485bf07dcc0cb0415296aa072c381e3c5f0613e"
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
