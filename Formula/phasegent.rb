class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.25.0/phasegent-v2.25.0-aarch64-apple-darwin"
      sha256 "b238064c0a3ced089ac3d4dbc11d290faf2afb54affae40727f134340c4fa6b7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.25.0/phasegent-v2.25.0-aarch64-unknown-linux-gnu"
      sha256 "08f1fcebaa398345467adfd77c9a01b35db5cf3e4a1e882683897982e1098fdd"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.25.0/phasegent-v2.25.0-x86_64-unknown-linux-gnu"
      sha256 "f110cfab1bc2ac03dfb67ead9e9361c4ab97d49021b7f97d11dfe6504569dc81"
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
