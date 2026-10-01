class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.8/phasegent-v2.21.8-aarch64-apple-darwin"
      sha256 "bf5d2bd30f13972545e869ce8b283c57ed5286ef3652dce3943d70e3ee3de191"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.8/phasegent-v2.21.8-aarch64-unknown-linux-gnu"
      sha256 "5d60e583564e8fb4c5c305f6d17c8bcdac765c2ea20a5e9577f0744fef6bd4c3"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.8/phasegent-v2.21.8-x86_64-unknown-linux-gnu"
      sha256 "bd530639b6eb323d6cbdd0ffb6e07e203ff6975c6e965d326757c0c8eb2e8ba3"
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
