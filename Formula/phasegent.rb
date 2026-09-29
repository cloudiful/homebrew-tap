class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.1/phasegent-v2.21.1-aarch64-apple-darwin"
      sha256 "4de548b986f16e5ea5f6b760a0237588a7f7a81c715c0f3cd1cf91470e2dfeb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.1/phasegent-v2.21.1-aarch64-unknown-linux-gnu"
      sha256 "c436ea86761a6f695f0dc18e9dcccb947ca33123911cd801ef6a9bd0fc4c4eaf"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.1/phasegent-v2.21.1-x86_64-unknown-linux-gnu"
      sha256 "f7145c62d786b5da72938fafd5c45b6a0618681c7a10c1e6753ce198b2c0af03"
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
