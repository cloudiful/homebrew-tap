class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.0/phasegent-v2.21.0-aarch64-apple-darwin"
      sha256 "73d8ec6433a1cc84b7e995fa0efbf8a2b4cc5c150be4ab7767b7f39e7ee05fb2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.0/phasegent-v2.21.0-aarch64-unknown-linux-gnu"
      sha256 "6327cadc36922341e2669ca7bf996da538f3142a5fe8910cbc92b17dc61221a9"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.0/phasegent-v2.21.0-x86_64-unknown-linux-gnu"
      sha256 "2442abc68d12d92541a4615c713b7c862495036e55832fd3888166d72490b1ec"
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
