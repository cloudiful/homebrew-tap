class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.2/phasegent-v2.21.2-aarch64-apple-darwin"
      sha256 "d272d154bc607a85bdebf8ba4513c65f8078deac08b4c0abd4ffb2c99271fa81"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.2/phasegent-v2.21.2-aarch64-unknown-linux-gnu"
      sha256 "a765bbfb83a6116dbf5a1f01fc1b273412e3487a708a33de9b5eb853594cb4bc"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.2/phasegent-v2.21.2-x86_64-unknown-linux-gnu"
      sha256 "ac3024d2f8571b6800dd5564bdde0dcfa875f855b2da2242f1fbf9eb2cd8a7d7"
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
