class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.5/phasegent-v2.18.5-aarch64-apple-darwin"
      sha256 "299fd62e27928507fdb72b1e1d3b4bdc2e20bb3ce7aeb36150603063835aa3b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.5/phasegent-v2.18.5-aarch64-unknown-linux-gnu"
      sha256 "2d9582608b5ee4b33e5256d7188f75dd38909c926b9e3a4081f27a513f336303"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.18.5/phasegent-v2.18.5-x86_64-unknown-linux-gnu"
      sha256 "f065ab5031e296042e7e0dbc9280dc240bc6d9829d0e869f1b2fdb7c8a0292f1"
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
