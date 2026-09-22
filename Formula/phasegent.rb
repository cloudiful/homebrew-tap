class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.4/phasegent-v2.18.4-aarch64-apple-darwin"
      sha256 "0d467c3ad0cfa025e29b71d127ebe0423bc0798635179c2d25fa2d04baed1823"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.4/phasegent-v2.18.4-aarch64-unknown-linux-gnu"
      sha256 "255093a6201bb62c89a90d0c09d6184417031fe1ef99f54f5b60bf7ab582b488"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.4/phasegent-v2.18.4-x86_64-unknown-linux-gnu"
      sha256 "4b458b417e4bc4596549487d0994bde394539b38c645ff87857842de68e40067"
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
