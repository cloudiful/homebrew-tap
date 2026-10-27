class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.0/phasegent-v2.32.0-aarch64-apple-darwin"
      sha256 "ea56c32a1c27f8fcf3dcc5b765dd352ce9af281cc3d4a9d5e31f9be170010887"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.0/phasegent-v2.32.0-aarch64-unknown-linux-gnu"
      sha256 "e69cf9fc372a320265b9153e7b92324f4df25fdaf00fcbcfce002ce8d9c54956"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.32.0/phasegent-v2.32.0-x86_64-unknown-linux-gnu"
      sha256 "89b05f282aa07e976c95610b85039a549c9cd6e352428ec576de1da8b1b1dead"
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
