class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.3/phasegent-v2.18.3-aarch64-apple-darwin"
      sha256 "e3d7d0d659454149b3e4f96eb5b59fad2f246d2aa9f3c92a124549fb830457be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.3/phasegent-v2.18.3-aarch64-unknown-linux-gnu"
      sha256 "e6509b002a6d626931512aa7ddae16c793090c250443a60dff21b24c5f0753e5"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.3/phasegent-v2.18.3-x86_64-unknown-linux-gnu"
      sha256 "d9979b4a07a87141f7a60d4a6ee54b0159017e5ad49008988a64e6330ac92604"
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
